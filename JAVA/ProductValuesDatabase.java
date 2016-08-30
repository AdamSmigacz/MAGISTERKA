package Database;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

public class ProductValuesDatabase extends SQLiteOpenHelper{

	
	public static final String PRODUCTVALUESTABLENAME = "PRODUCTVALUES_T";
	public static final String PRODUCTVALUES_DATABASENAME = "PRODUCTVALUES_T.db";
	public static final int PRODUCTVALUES_DATABASEVERSION = 1;
	public static final String PRODUCTVALUES_PRODUCTID = "PRODUCT_ID";
	public static final String PRODUCTVALUES_PRODUCTVALUES = "PRODUCT_VALUES";
	public static final String PRODUCTVALUES_CATEGORYID = "CATEGORY_ID";
	
	public ProductValuesDatabase(Context context) {
		super(context, PRODUCTVALUES_DATABASENAME, null, PRODUCTVALUES_DATABASEVERSION);
		// TODO Auto-generated constructor stub
	}

	@Override
	public void onCreate(SQLiteDatabase db) {
		db.execSQL("CREATE TABLE " + PRODUCTVALUESTABLENAME + " (" + 
				PRODUCTVALUES_PRODUCTID + " INTEGER, " + 
				PRODUCTVALUES_PRODUCTVALUES + " TEXT NOT NULL , " + 
				PRODUCTVALUES_CATEGORYID + " INTEGER " );
		
	}

	@Override
	public void onUpgrade(SQLiteDatabase arg0, int arg1, int arg2) {
		// TODO Auto-generated method stub
		
	}

}
