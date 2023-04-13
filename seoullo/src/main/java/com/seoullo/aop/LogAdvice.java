package com.seoullo.aop;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Aspect
@Log4j
@Component
public class LogAdvice {

	@Around("execution(* com.seoullo.*.service.*.*(..))")
	public Object servicelog(ProceedingJoinPoint pjp) {
		log.info("Target: " + pjp.getTarget());
		log.info("Method: " + pjp.getSignature());
		log.info("Param: " + Arrays.toString(pjp.getArgs()));
		Object result = null;
		try {
			result = pjp.proceed();
		} catch (Throwable e) {
			e.printStackTrace();
		}
		log.info("result: " + result);
		return result;
	}

}
