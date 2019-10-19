public class DataManager_Opportunity implements Queueable {
    private map<string, map<string,id>> objectIdbyName;
    private map<string, Account> accountByName;
    
    // List of Opps to importand matching Accounts, initiated in the constructor
    public List<Opportunity> DTC_Opps;
    
    // The absolute days difference initiated at construction
    private Integer absDaysDiff;
    
    // =========================================================================
    //           Class Functions (constructor and execute)
    // =========================================================================
    
    public DataManager_Opportunity() {
        // Init Object IDs map
        objectIdbyName = DataManager_Utils.getObjectIdbyName();
        absDaysDiff = DataManager_Utils.getAbsDaysDiff();
        
        
        // Init account map
        initAccs();
        
        // Read DTC_Opps CSV
        DTC_Opps = createOpps(DataManager_Utils.getCsv('DTC_Opportunity'));
    }
    
    public void execute(QueueableContext context) {
        // Insert Opps
        insert DTC_Opps;
        
        // Delete useless Accounts
        delete accountByName.values();
        
        // ==============================================
        // 					NEXT JOB!
        // ==============================================
        
        if(!test.isRunningTest()) {
            // 2 - Add DTC Opp Line Items and Histories
            System.enqueueJob(new DataManager_OpportunityRelated());
        }
    }
    
    // =========================================================================
    //           Opp Record Creation
    // =========================================================================
    
    public void initAccs() {
        accountByName = new map<string, Account>();
        
        Account[] accs = [SELECT Id, Name FROM Account];
        for (Integer i=1;i<accs.size();i++)
        {
            Account acc = accs[i];
            
            // Add the Account to the list
            accountByName.put(acc.Name, acc);
        }
    }
    
    public List<Opportunity> createOpps(String[] filelines) {
        // Process CSV lines
        List<Opportunity> Opps = new List<Opportunity>();
        
        if (filelines != null) {
            for (Integer i=1;i<filelines.size();i++)
            {
                String[] inputvalues = filelines[i].split(',');
                
                // Remove the Account to the Accs list to delete
                String acctName = inputValues[0];
                accountByName.remove(acctName);
                
                // Create Opps
                Opportunity temp = new Opportunity();
                temp.AccountId = objectIdbyName.get('Account').get(acctName);
                temp.Amount = integer.ValueOf(inputValues[1]);
                temp.CloseDate = DataManager_Utils.string2Date(inputValues[2]).addDays(absDaysDiff);
                temp.LeadSource = inputValues[3];
                temp.Name = inputValues[4];
                temp.OwnerId = objectIdbyName.get('User').get(inputValues[5]);
                temp.StageName = inputValues[6];
                temp.Type = inputValues[7];
                temp.CreatedDate = DataManager_Utils.string2Date(inputValues[8]).addDays(absDaysDiff);
                // !! ForecastCategory --> 9 !!
                temp.Opportunity_Source__c = inputValues[10];
                
                // Add the Opp to the list is it's in the biggest time frame (up to when we pick 1/3 of the opps only)
                if (DataManager_Utils.isInTimeframe(temp, DataManager_Utils.ROLLBACK_DAYS_THIRD)) {
                    Opps.add(temp);
                }
            }
        }
        else {
            System.debug('Error: Empty filelines for Opportunities!');
        }
        return Opps;
    }
}