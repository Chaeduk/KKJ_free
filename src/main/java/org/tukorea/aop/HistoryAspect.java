package org.tukorea.aop;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class HistoryAspect {
	
	@After(value = "execution(* org.tukorea.myweb.persistence.HistoryDAOImpl.Borrowing(..))")
	public void afterMethod() {
		System.out.println("Borrowing 메서드 호출!!");
	}

}
