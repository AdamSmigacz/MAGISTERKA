package Database;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

public class UserDatabase extends SQLiteOpenHelper {

	public static final String USERTABLENAME = "USERS_T";
	public static final String USER_ID = "ID";
	public static final String USER_LOGIN = "LOGIN";
	public static final String USER_PASSWORD = "PASSWORD";
	public static final String USER_NAME = "NAME";
	public static final String USER_LASTNAME = "LAST_NAME";
	public static final String USER_DATABASENAME = "USERS.db";
	public static final int USER_DATABASEVERSION = 1;
	
	
	public UserDatabase(Context context) {
		super(context, USER_DATABASENAME, null , USER_DATABASEVERSION);
		// TODO Auto-generated constructor stub
	}

	@Override
	public void onCreate(SQLiteDatabase db) {
		db.execSQL("CREATE TABLE " + USERTABLENAME + " (" + 
				USER_ID + " INTEGER PRIMARY KEY AUTOINCREMENT, " + 
				USER_LOGIN + " TEXT NOT NULL, " + 
				USER_PASSWORD + " TEXT NOT NULL, " +
				USER_NAME  + " TEXT, " +
				USER_LASTNAME  + " TEXT");
		
	}

	public void registerUser(Integer id, String login, String password, String name, String lastName)
	{
		SQLiteDatabase db = getWritableDatabase();
		ContentValues UserAttributes = new ContentValues();
		UserAttributes.put(USER_ID, id);
		UserAttributes.put(USER_LOGIN, login);
		UserAttributes.put(USER_PASSWORD, password);
		UserAttributes.put(USER_NAME, name);
		UserAttributes.put(USER_LASTNAME, lastName);
		db.insertOrThrow(USERTABLENAME, null, UserAttributes);
	}
	
	public void changePassword(String login, String password)
	{
		SQLiteDatabase db = getWritableDatabase();
		ContentValues UserAttributes = new ContentValues();
		UserAttributes.put(USER_PASSWORD, password);
		String args [] = {login};
		db.update(USERTABLENAME, UserAttributes, "login = ?", args);
	}
	
	
	public int loginUser(String login, String password)
	{
		SQLiteDatabase db = getReadableDatabase();
		String SQL_STATEMENT = "SELECT * FROM " + USERTABLENAME + "WHERE " + USER_LOGIN + " =? AND " + USER_PASSWORD + "=?";
		Cursor userCursor = db.rawQuery(SQL_STATEMENT, new String []{login, password});
		int curosrCounter = userCursor.getCount();
		db.close();
		if (curosrCounter > 0 )
		{
			return curosrCounter;
		}else 
		{
			return 0;
		}
		
	}
	
	@Override
	public void onUpgrade(SQLiteDatabase db, int arg1, int arg2) {
		// TODO Auto-generated method stub
		
	}

}
