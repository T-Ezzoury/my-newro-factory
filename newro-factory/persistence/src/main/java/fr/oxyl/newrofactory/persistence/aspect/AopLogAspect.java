package fr.oxyl.newrofactory.persistence.aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class AopLogAspect {
    
    private final static Logger LOGGER = LoggerFactory.getLogger(AopLogAspect.class);

    @Around("within(fr.oxyl.newrofactory.persistence.dao..*)")
    public Object logAroundDaoMethods(ProceedingJoinPoint joinPoint) throws Throwable {
        LOGGER.info("Entering DAO method: {}.{}() with arguments: {}",
                joinPoint.getSignature().getDeclaringTypeName(),
                joinPoint.getSignature().getName(),
                joinPoint.getArgs());
        try {
            Object result = joinPoint.proceed();
            LOGGER.info("After executing DAO method: {}.{}() with result: {}",
                    joinPoint.getSignature().getDeclaringTypeName(),
                    joinPoint.getSignature().getName(),
                    result);
            return result;
        } catch (Throwable throwable) {
            LOGGER.error("Exception in DAO method: {}.{}() with message: {}",
                    joinPoint.getSignature().getDeclaringTypeName(),
                    joinPoint.getSignature().getName(),
                    throwable.getMessage(), throwable);
            throw throwable;
        }
    }
    
}
