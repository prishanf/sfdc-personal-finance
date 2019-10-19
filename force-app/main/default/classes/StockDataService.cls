public with sharing class StockDataService {
    
    public static final String END_POINT ='https://query1.finance.yahoo.com/v7/finance/quote?region=CA&symbols=';
    public StockDataService() {

    }

    public static Double getCurrentStockPrice(String symbol){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(END_POINT + symbol);
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            // Deserialize the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'animals' key as a list
            Map<String, Object> quoteResp = (Map<String, Object>) results.get('quoteResponse');
            List<Object> stockResult = (List<Object>) quoteResp.get('result');
            Double  regularMarketPrice = (Double) ((Map<String, Object>) stockResult.get(0)).get('regularMarketPrice');
            System.debug(regularMarketPrice);
            return regularMarketPrice;
        }
        return null;
        
    }
    
   
    public static Map<String,Double> getCurrentStockPrice(List<String> symbols){
        Map<String,Double> resultMap = new Map<String,Double>();
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(END_POINT+ String.join(symbols,','));
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            // Deserialize the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'animals' key as a list
            Map<String, Object> quoteResp = (Map<String, Object>) results.get('quoteResponse');
            List<Object> stockResult = (List<Object>)quoteResp.get('result');
            for(Object stockItemMap : stockResult){
                Map<String, Object> stockItem = (Map<String, Object>) stockItemMap;
                String symbol = (String) stockItem.get('symbol');
                Double  regularMarketPrice = (Double) stockItem.get('regularMarketPrice');
                resultMap.put(symbol,regularMarketPrice);
            }
            System.debug(resultMap);
        }
        return resultMap;
        
    }
    /*
    @Future(callout=true)
    public static void updateAccountStockPrices(){
        List<String> symbolList = new List<String>();
        List<Bank_Account__c> accounts = [SELECT Id, stock_symbol__c FROM 
                                          Bank_Account__c WHERE type__c='Stock' AND stock_symbol__c != null];
        for(Bank_Account__c acc : accounts){
            symbolList.add(acc.stock_symbol__c);
        }
        Map<String,double> qouteMap = StockDataService.getCurrentStockPrice(symbolList);
        for (Bank_Account__c acc : accounts){
            acc.Current_Market_Price__c  = qouteMap.get(acc.stock_symbol__c);
        }
        System.debug(accounts);
        update accounts;
    }
    @Future(callout=true)
    public static void insertStockPrices(){
        
        Stock_Price_History__c shistory = new Stock_Price_History__c();
        Map<String,double> qouteMap = StockDataService.getCurrentStockPrice(new List<String>{'FTN.TO'});
        
           shistory.Symbol__c   = 'FTN.TO';
           shistory .Price__c = qouteMap.get('FTN.TO');
           shistory.Date__c = Date.today();
           Datetime dt = Datetime.now();
           shistory.Time__c = Time.newInstance(dt.hour(),dt.minute(),0,0);

        System.debug(shistory);
        insert shistory;
    }*/
}