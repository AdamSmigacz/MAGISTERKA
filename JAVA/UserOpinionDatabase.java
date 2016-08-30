package Database;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

public class UserOpinionDatabase extends SQLiteOpenHelper{

	public static final String USEROPINIONTABLENAME = "USERSOPINION_T";
	public static final String USEROPINION_DATABASENAME = "USERSOPINION.db";
	public static final int USEROPINION_DATABASEVERSION = 1;
	public static final String USEROPINION_ID = "ID";
	public static final String USEROPINION_USERID = "USER_ID";
	public static final String USEROPINION_SHOPID = "SHOP_ID";
	public static final String USEROPINION_PRODUCTID = "PRODUCT_ID";
	public static final String USEROPINION_OPINION = "OPINION";
	public static final String USEROPINION_RATE = "RATE";


	
	
	public UserOpinionDatabase(Context context) {
		super(context, USEROPINION_DATABASENAME, null, USEROPINION_DATABASEVERSION);

	}

	@Override

	public void onCreate(SQLiteDatabase db) {
		db.execSQL("CREATE TABLE " + USEROPINIONTABLENAME + " (" + 
				USEROPINION_ID + " INTEGER PRIMARY KEY AUTOINCREMENT, " + 
				USEROPINION_USERID + " INTEGER NOT NULL, " + 
				USEROPINION_SHOPID + " INTEGER NOT NULL, " +
				USEROPINION_PRODUCTID + " INTEGER NOT NULL, " +
				USEROPINION_OPINION  + " TEXT, " + 
				USEROPINION_RATE + " INTEGER ");
				

	}

	@Override
	public void onUpgrade(SQLiteDatabase arg0, int arg1, int arg2) {
		// TODO Auto-generated method stub
		
	}

}
