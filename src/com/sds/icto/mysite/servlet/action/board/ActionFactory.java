package com.sds.icto.mysite.servlet.action.board;

import com.sds.icto.mysite.servlet.action.main.IndexAction;
import com.sds.icto.web.Action;

public class ActionFactory {
	private static ActionFactory instance;
	
	static{
		instance = new ActionFactory();
	}
	
	private ActionFactory() {
	}
	
	public static ActionFactory getInstance(){
//		if(instance == null){
//			instance = new ActionFactory();
//		}
		return instance;
	}

	public Action getAction(String a){
		Action action = null;

		if("boardlist".equals(a)){
			action = new BoardListAction();
		}else if("insertform".equals(a)){
			action = new InsertFormAction();
		}else if("insert".equals(a)){
			action = new InsertAction();
		}else if("view".equals(a)){
			action = new ViewAction();
		}else if("update".equals(a)){
			action = new UpdateAction();
		}else if("delete".equals(a)){
			action = new DeleteAction();
		}else if("search".equals(a)){
			action = new SearchAction();
		}
		
		/* default action */
		if(action == null){
			action = new IndexAction();
		}
		return action;
	}
	
}
