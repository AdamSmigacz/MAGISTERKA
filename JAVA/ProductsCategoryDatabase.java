package Database;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

public class ProductsCategoryDatabase extends SQLiteOpenHelper {


	public static final String USERTABLENAME = "PRODUCTSCATEGORY_T";
	public static final String PRODUCTCATEGORY_ID = "ID";
	public static final String PRODUCTCATEGORY_PARENTID = "PARENT_ID";
	public static final String PRODUCTCATEGORY_NAME = "NAME";
	public static final String PRODUCTCATEGORY_DATABASENAME = "PRODUCTSCATEGORY_T.db";
	public static final int PRODUCTCATEGORY_DATABASEVERSION = 1;
	
	public ProductsCategoryDatabase(Context context) {
		super(context, PRODUCTCATEGORY_DATABASENAME , null, PRODUCTCATEGORY_DATABASEVERSION);
	}
	
	
	@Override
	public void onCreate(SQLiteDatabase db) {
		db.execSQL("CREATE TABLE " + USERTABLENAME + " (" + 
				PRODUCTCATEGORY_ID + " INTEGER PRIMARY KEY AUTOINCREMENT, " + 
				PRODUCTCATEGORY_PARENTID + " INTEGER , " + 
				PRODUCTCATEGORY_NAME + " TEXT NOT NULL " );
		
	}
	@Override
	public void onUpgrade(SQLiteDatabase arg0, int arg1, int arg2) {
		// TODO Auto-generated method stub
		
	}
	
}
