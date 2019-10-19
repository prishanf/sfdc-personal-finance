public with sharing class OFXParser {

    public List<OfxTransaction> parse(String file) {
        return parseFile(file);
    }
    
    private List<OfxTransaction> parseFile(String content){
   
       List<String> lines = readAll(content);
	   List<OfxTransaction> trans = new List<OfxTransaction>();
	   Boolean inTransaction =false;
	   for(String line : lines){
		   
		   if(line.contains('<STMTTRN>')){
			   trans.add(new OfxTransaction());
			   inTransaction=true;
		   }
		   if(line.contains('</STMTTRN>')){
			   inTransaction=false;
		   }
		   if(inTransaction){
               
			   OfxTransaction t = trans.get(trans.size()-1);
			   updateTransaction(line, t);
		   }
	   }
       System.debug(lines.size());
       System.debug(trans.size());
        return trans;
    }
    
    private void updateTransaction(String line, OfxTransaction t) {
		
		if(line.contains('<TRNAMT>')){
               String newString =  line.replace('</TRNAMT>','');	
			   String text = newString.split('<TRNAMT>')[1];
			   if (text.startsWith('-')) {
				   t.transType = TransctionType.DEBIT ;
				   t.Amount = Decimal.valueOf(text.substring(1));
			   }else{
				   t.transType = TransctionType.CREDIT;
				   t.Amount = Decimal.valueOf(text);
			   }
			   
		}else if(line.contains('<NAME>')){
           String newString =  line.replace('</NAME>','');	
		   String text =newString.split('<NAME>')[1];
		 	   t.Name = text;
		   
	   }else if(line.contains('MEMO')){
           String newString =  line.replace('</MEMO>','');	
		   String text =newString.split('<MEMO>')[1];
           if(text.contains('Confirmation')){
               t.Memo = text.split('Confirmation')[0];
           }else{
               t.Memo = text;
           }
		   
		   
	   } else if (line.contains('DTPOSTED')) {
		   String newString =  line.replace('</DTPOSTED>','');	
           String text =newString.split('<DTPOSTED>')[1];
	        t.tDate = getDate(text);
	   }
	}
    
    private Date getDate(String dateText){
        Integer year = Integer.valueOf(dateText.substring(0,4));
        Integer month = Integer.valueOf(dateText.substring(4,6));
        Integer day = Integer.valueOf(dateText.substring(6,8));
        return Date.newInstance(year, month, day);
    }
    
    private List<String> readAll(String content){
        	List<String> initalSplit= content.split('\n');
        	List<String> lines= new List<String>();
        	
            for(String line :initalSplit){
            	if(line.endsWith('</STMTTRN>')){
            		lines.add(line.substring(0,line.indexOf('</STMTTRN>')));
            		lines.add(line.substring(line.indexOf('</STMTTRN>'),line.length()));
            	}else{
            		lines.add(line);
            	}
            	
            }
            return lines;
    }
    
    
    public enum TransctionType {
        	CREDIT,
        	DEBIT
    }
    
    public class OfxTransaction{
        
        public TransctionType transType {get;set;}
        public Decimal amount {get;set;}
        public String name {get;set;}
        public String memo {get;set;}
        public Date tdate {get;set;}
        public String fitid {get;set;}
    }
}