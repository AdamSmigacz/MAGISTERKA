package Database;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

public class ProductsDatabase extends SQLiteOpenHelper{

	public static final String PRODUCTSTABLENAME = "PRODUCTS_T";
	public static final String PRODUCTS_DATABASENAME = "PRODUCTS.db";
	public static final int PRODUCTS_DATABASEVERSION = 1;
	
	public static final String PRODUCTS_ID = "ID";
	public static final String PRODUCTS_NAME = "NAME";
	public static final String PRODUCTS_SHOPID = "SHOP_ID";
	public static final String PRODUCTS_PRICE = "PRICE";

	
	
	public ProductsDatabase(Context context) {
		super(context, PRODUCTS_DATABASENAME, null, PRODUCTS_DATABASEVERSION);
	}

	@Override
	public void onCreate(SQLiteDatabase db) {
		db.execSQL("CREATE TABLE " + PRODUCTSTABLENAME + " (" + 
				PRODUCTS_ID + " INTEGER PRIMARY KEY AUTOINCREMENT, " + 
				PRODUCTS_NAME + " TEXT NOT NULL, " + 
				PRODUCTS_SHOPID + " INTEGER NOT NULL, " +
				PRODUCTS_PRICE  + " INTEGER NOT NULL ");
		
	}

	@Override
	public void onUpgrade(SQLiteDatabase arg0, int arg1, int arg2) {
		// TODO Auto-generated method stub
		
	}

}
