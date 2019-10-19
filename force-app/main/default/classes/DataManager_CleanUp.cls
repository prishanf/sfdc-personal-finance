// Clean up the Org from Opps and linked objects (i.e. OppHistory__c and OppLineItem)
public class DataManager_CleanUp implements Queueable  {
    private map<string, map<string,id>> objectIdbyName;
    
    // List of Accs to edit, initiated in the constructor
    private List<Account> DTC_Accs;
    
    
    public DataManager_CleanUp() {
        // Init Object IDs map
        objectIdbyName = DataManager_Utils.getObjectIdbyName();
        
        // Init Accounts list
        DTC_Accs = createAccs(DataManager_Utils.getCsv('DTC_Account'));
    }
    
	public void execute(QueueableContext context) {
        // Delete old Tasks
        Task[] tasks = [SELECT Id FROM Task];
        if (tasks.size() > 0) {
            delete tasks;
        }
        
        // Delete old Events
        Event[] events = [SELECT Id FROM Event];
        if (events.size() > 0) {
            delete events;
        }
        
        // Delete old OppsHistories
        OpportunityHistory__c[] oppHists = [SELECT Amount__c,CloseDate__c,CreatedDate,ExpectedRevenue__c,ForecastCategory__c,Id,Name,OpportunityId__c,Probability__c,StageName__c FROM OpportunityHistory__c];
        if (oppHists.size() > 0) {
            delete oppHists;
        }
        
        // Delete Opps
        Opportunity[] opps = [select Account.Name,Amount,CreatedDate,CloseDate,LeadSource,Name,Owner.Name,StageName,Type from Opportunity];
        if (opps.size() > 0) {
            delete opps;  
        } 
        
        // Delete Accounts
        Account[] accs = [select Id from Account];
        if (accs.size() > 0) {
            delete accs;  
        }
        
        insert DTC_Accs;
        
        // ==============================================
        // 					NEXT JOB!
        // ==============================================
        
        if(!test.isRunningTest()) {
            // 1 - Add Accounts and Opps
            System.enqueueJob(new DataManager_Opportunity());
        }
    }
    
    // =========================================================================
    //           Account Record Creation
    // =========================================================================
	
    public List<Account> createAccs(String[] filelines) {
        List<Account> Accs = new List<Account>();
        for (Integer i=1;i<filelines.size();i++)
        {
            String[] inputvalues = filelines[i].split(',');
            
            // Replace classic Admin User by the actual admin name!
            String userName = inputValues[5];
            if (userName == 'Admin User') {
                userName = UserInfo.getName();
            }
            
            Account temp = new Account();
            temp.Industry = inputValues[0];
            temp.Name = inputValues[1];
            temp.AccountSource = inputValues[2];
            temp.BillingCountry = inputValues[3];
            temp.BillingState = inputValues[4];
            temp.OwnerId = objectIdbyName.get('User').get(userName);
            temp.Type = inputValues[6];
            temp.Segment__c = inputValues[7];
            
            // Add the Account to the list
            Accs.add(temp);
        }
        
        return Accs;
    }
}