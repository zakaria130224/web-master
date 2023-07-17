package com.xyz.bd.webmaster.Utility.Advice;


import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class ExecutionTracker {

    Logger logger = LoggerFactory.getLogger(ExecutionTracker.class);
    @Around("@annotation(com.xyz.bd.webmaster.Utility.Advice.TrackExecution)")
    public Object trackTime( ProceedingJoinPoint pjp) throws Throwable {
        long startTime=System.currentTimeMillis();
        Object obj= pjp.proceed();
        long endTime=System.currentTimeMillis();
        logger.info("Method:{} Time: {} Req: {} Res: {}",pjp.getSignature(),(endTime-startTime),pjp.getArgs(),obj);
        return obj;

    }
}
