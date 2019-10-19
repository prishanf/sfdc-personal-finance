public class POSDashboardCtrl {
    
    public List<Product2> prods{get; set;}
	
    public POSDashboardCtrl(){
       prods = [select id, Name, Family from Product2 limit 10];
    }

}