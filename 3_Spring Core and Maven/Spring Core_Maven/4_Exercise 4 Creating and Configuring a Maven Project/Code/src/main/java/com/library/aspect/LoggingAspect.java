package com.library.aspect;

import org.aspectj.lang.JoinPoint;

public class LoggingAspect {

    public void logBefore(JoinPoint joinPoint) {
        System.out.println("[XML LOG] Before method: " + joinPoint.getSignature());
    }

    public void logAfter(JoinPoint joinPoint) {
        System.out.println("[XML LOG] After method: " + joinPoint.getSignature());
    }
}
