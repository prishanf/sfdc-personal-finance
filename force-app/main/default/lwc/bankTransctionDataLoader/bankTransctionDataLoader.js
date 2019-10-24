import { LightningElement, track, api } from 'lwc';
import saveFile from '@salesforce/apex/BankTransactionDataLoaderCtrl.saveFile';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

const columns = [
    { label: 'TRNTYPE', fieldName: 'TRNTYPE' },
    { label: 'DTPOSTED', fieldName: 'DTPOSTED' },
    { label: 'MEMO', fieldName: 'MEMO' },
    { label: 'TRNAMT', fieldName: 'TRNAMT' },
    { label: 'FITID', fieldName: 'FITID' },
    { label: 'NAME', fieldName: 'NAME', editable: 'true' },
];

export default class BankTransctionDataLoader extends LightningElement {
    @track columns = columns;
    @track data;
    @track UploadFile = 'Upload File';
    @track showLoadingSpinner = false;
    @track isLoading = false;
    @track fileName = '';

    selectedRecords;
    filesUploaded = [];
    file;
    fileContents;
    fileReader;
    content;
    MAX_FILE_SIZE = 1500000;

    connectedCallback() {}

    // getting file
    handleFilesChange(event) {
        if (event.target.files.length > 0) {
            this.filesUploaded = event.target.files;
            this.fileName = event.target.files[0].name;
        }
    }

    handleSave() {
        if (this.filesUploaded.length > 0) {
            this.uploadHelper();
        } else {
            this.fileName = 'Please select file to upload!!';
        }
    }

    uploadHelper() {
        this.file = this.filesUploaded[0];
        if (this.file.size > this.MAX_FILE_SIZE) {
            window.console.log('File Size is to long');
            return;
        }
        this.isLoading = true;
        this.showLoadingSpinner = true;
        // create a FileReader object
        this.fileReader = new FileReader();
        // set onload function of FileReader object
        this.fileReader.onloadend = () => {
            this.fileContents = this.fileReader.result;
            let base64 = 'base64,';
            this.content = this.fileContents.indexOf(base64) + base64.length;
            this.fileContents = this.fileContents.substring(this.content);
            window.console.table(this.fileContents);
            // call the uploadProcess method
            this.saveToFile();
        };

        this.fileReader.readAsDataURL(this.file);
    }

    // Calling apex class to insert the file
    saveToFile() {
        saveFile({
            idParent: this.recordId,
            strFileName: this.file.name,
            base64Data: encodeURIComponent(this.fileContents),
        })
            .then(result => {
                window.console.table(result);
                this.data = result;
                this.fileName = this.fileName + ' - Uploaded Successfully';
                this.UploadFile = 'File Uploaded Successfully';
                this.isLoading = false;
                this.showLoadingSpinner = false;
                // Showing Success message after file insert
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success!!',
                        message: this.file.name + ' - Uploaded Successfully!!!',
                        variant: 'success',
                    }),
                );
            })
            .catch(error => {
                // Showing errors if any while inserting the files
                this.isLoading = true;
                window.console.log(error);
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error while uploading File',
                        message: error.message,
                        variant: 'error',
                    }),
                );
            });
    }
}
