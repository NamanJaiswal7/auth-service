package com.authservice.service;

import com.authservice.model.AuditLog;
import com.authservice.repository.AuditLogRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AuditService {

    private final AuditLogRepository auditLogRepository;

    @Async
    public void logEvent(String email, String action, String details, String ip) {
        var log = AuditLog.builder()
                .userEmail(email)
                .action(action)
                .details(details)
                .ipAddress(ip)
                .build();
        auditLogRepository.save(log);
    }
}
