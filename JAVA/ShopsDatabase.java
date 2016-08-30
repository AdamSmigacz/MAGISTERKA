package Database;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

public class ShopsDatabase extends SQLiteOpenHelper{

	public static final String SHOPSTABLENAME = "SHOPS_T";
	public static final String SHOPS_DATABASENAME = "SHOPS.db";
	public static final int SHOPS_DATABASEVERSION = 1;
	
	public static final String SHOPS_ID = "ID";
	public static final String SHOPS_NAME = "NAME";
	public static final String SHOPS_STREET = "STREET";
	public static final String SHOPS_ADDRESSNUMBER = "ADDRESS_NUMBER";
	public static final String SHOPS_POSTALCODE = "POSTAL_CODE";
	public static final String SHOPS_EMAILADDRESS = "EMAIL_ADDRESS";
	public static final String SHOPS_PHONENUMBER = "PHONE_NUMBER";
	public static final String SHOPS_MOBILENUMBER = "MOBILE_NUMBER";
	
	
	public ShopsDatabase(Context context) {
		super(context, SHOPS_DATABASENAME, null, SHOPS_DATABASEVERSION);
	}

	@Override
	public void onCreate(SQLiteDatabase db) {
		db.execSQL("CREATE TABLE " + SHOPSTABLENAME + " (" + 
				SHOPS_ID + " INTEGER PRIMARY KEY AUTOINCREMENT, " + 
				SHOPS_NAME + " TEXT NOT NULL, " + 
				SHOPS_STREET + " TEXT NOT NULL, " + 
				SHOPS_ADDRESSNUMBER + " TEXT NOT NULL, " + 
				SHOPS_POSTALCODE + " TEXT NOT NULL, " + 
				SHOPS_EMAILADDRESS + " TEXT NOT NULL, " + 
				SHOPS_PHONENUMBER + " TEXT NOT NULL, " + 
				SHOPS_MOBILENUMBER + " TEXT NOT NULL");
		
	}

	@Override
	public void onUpgrade(SQLiteDatabase arg0, int arg1, int arg2) {
		// TODO Auto-generated method stub
		
	}

}
