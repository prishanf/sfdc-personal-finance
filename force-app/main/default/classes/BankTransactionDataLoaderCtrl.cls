public class BankTransactionDataLoaderCtrl {

    @AuraEnabled
    public static List<Map<String,String>> saveFile(String base64Data) {
        // Decoding base64Data
        base64Data = EncodingUtil.urlDecode(base64Data, 'UTF-8');
        Blob data  = EncodingUtil.base64Decode(base64Data);
        return readCSVFile(data.toString());
    }

    private static List<Map<String,String>> readCSVFile(String data){

        Integer startIndex = data.indexOf('<STMTTRN>');
        Integer endIndex = data.indexOf('</BANKTRANLIST>');
        String trns = data.substring(startIndex,endIndex);
        String cleanTrans = trns.replaceAll('<STMTTRN>','').replaceAll('<', '');
        List<String> lines = trns.split('</STMTTRN>');
        List<Map<String,String>> transactionList = new List<Map<String,String>>();

        for(String line :lines){

            if(line.length()>10){
                System.debug(LoggingLevel.Error, line);
                transactionList.add(extractTransction(line));
            }

        }
        System.debug(LoggingLevel.Error, transactionList);
        return transactionList;
    }

    private static Map<String,String> extractTransction(String data){
        Map<String,String> keyValueMap= new Map<String,String>();
        data = data.replaceAll('<STMTTRN>','');
        data = data.replaceAll('<', '');
        data = data.trim();
       // System.debug(LoggingLevel.Error, data);
        List<String> columns = data.split('\n');
        //System.debug(LoggingLevel.Error, columns);
        for(String item :columns){
            if(item.contains('>')){
                //System.debug(LoggingLevel.Error, item);
                String[] keyValue = item.split('>');
                String key = keyValue[0].trim();
                String value = keyValue[1].trim();
                String endTag = '/'+key;
                value = value.replaceAll(endTag,'');
                keyValueMap.put(key,value);
            }
        }
        return keyValueMap;
    }
}
