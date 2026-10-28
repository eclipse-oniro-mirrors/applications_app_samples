/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect } from '@ohos/hypium';

const MASK: string = '***';

const SECURE_FIELD_DESCRIPTION: string = 'masked field';

const MAX_ANNOUNCEMENT_LENGTH: number = 120;

interface SecureLabel {
  label: string;
  description: string;
  sensitive: boolean;
}

// Ensures sensitive values are never exposed to a11y services
class SecureLabelSanitizer {
  public static isSensitiveKey(key: string): boolean {
    const lower = key.toLowerCase();
    return lower.indexOf('phone') >= 0 || lower.indexOf('token') >= 0 ||
      lower.indexOf('password') >= 0 || lower.indexOf('udid') >= 0;
  }

  public static mask(value: string): string {
    if (value.length <= 6) {
      return MASK;
    }
    return value.substring(0, 2) + MASK + value.substring(value.length - 2);
  }

  public static sanitize(label: string, sensitive: boolean): SecureLabel {
    if (!sensitive) {
      return { label: label, description: '', sensitive: false };
    }
    return { label: SECURE_FIELD_DESCRIPTION, description: '', sensitive: true };
  }

  public static sanitizeDescription(value: string, sensitive: boolean): string {
    return sensitive ? SECURE_FIELD_DESCRIPTION : value;
  }

  public static truncateAnnouncement(message: string): string {
    if (message.length <= MAX_ANNOUNCEMENT_LENGTH) {
      return message;
    }
    return message.substring(0, MAX_ANNOUNCEMENT_LENGTH);
  }

  public static containsSensitiveData(message: string): boolean {
    const lower = message.toLowerCase();
    return lower.indexOf('token=') >= 0 || lower.indexOf('password=') >= 0 ||
      SecurityA11yPattern.hasPhone(lower);
  }
}

class SecurityA11yPattern {
  public static hasPhone(value: string): boolean {
    return new RegExp('[0-9]{11}').test(value);
  }
}

// Controls whether a window allows a11y screen capture
class SecureWindowPolicy {
  private secure: boolean = false;
  private screenshotAllowed: boolean = true;

  public setSecure(secure: boolean): void {
    this.secure = secure;
    this.screenshotAllowed = !secure;
  }

  public isSecure(): boolean {
    return this.secure;
  }

  public isScreenshotAllowed(): boolean {
    return this.screenshotAllowed;
  }

  public canAnnounceSensitive(): boolean {
    return !this.secure;
  }

  public requiresMaskedDescription(): boolean {
    return this.secure;
  }
}

// Announces permission results without leaking identifiers
class PermissionAnnouncer {
  private announcements: string[] = [];

  public announcePermission(feature: string, granted: boolean): string {
    const message = granted ? `${feature} permission granted` : `${feature} permission denied`;
    this.announcements.push(SecureLabelSanitizer.truncateAnnouncement(message));
    return message;
  }

  public getCount(): number {
    return this.announcements.length;
  }

  public latest(): string {
    return this.announcements.length === 0 ? '' : this.announcements[this.announcements.length - 1];
  }

  public containsSensitive(): boolean {
    for (let i = 0; i < this.announcements.length; i++) {
      if (SecureLabelSanitizer.containsSensitiveData(this.announcements[i])) {
        return true;
      }
    }
    return false;
  }

  public clear(): void {
    this.announcements = [];
  }
}

// Audits a11y descriptions for secret leakage
class A11yAudit {
  private entries: SecureLabel[] = [];
  private violations: number = 0;

  public record(label: SecureLabel): void {
    this.entries.push(label);
    if (label.sensitive && label.description.length > 0) {
      this.violations++;
    }
  }

  public count(): number {
    return this.entries.length;
  }

  public violationCount(): number {
    return this.violations;
  }

  public sensitiveCount(): number {
    return this.entries.filter((entry: SecureLabel) => entry.sensitive).length;
  }

  public isClean(): boolean {
    return this.violations === 0;
  }

  public reset(): void {
    this.entries = [];
    this.violations = 0;
  }
}

export default function securityA11yTest() {
  describe('SecurityA11y_Test', () => {

    it('sanitizer_should_detect_sensitive_keys', 0, () => {
      expect(SecureLabelSanitizer.isSensitiveKey('phone')).assertTrue();
      expect(SecureLabelSanitizer.isSensitiveKey('userPhone')).assertTrue();
      expect(SecureLabelSanitizer.isSensitiveKey('accessToken')).assertTrue();
      expect(SecureLabelSanitizer.isSensitiveKey('PASSWORD')).assertTrue();
      expect(SecureLabelSanitizer.isSensitiveKey('devid')).assertFalse();
      expect(SecureLabelSanitizer.isSensitiveKey('description')).assertFalse();
    });

    it('sanitizer_should_mask_identifiers', 0, () => {
      expect(SecureLabelSanitizer.mask('13812345678')).assertEqual('13***78');
      expect(SecureLabelSanitizer.mask('123456')).assertEqual(MASK);
      expect(SecureLabelSanitizer.mask('')).assertEqual(MASK);
      expect(SecureLabelSanitizer.mask('abcdefgh')).assertEqual('ab***gh');
    });

    it('sanitizer_should_replace_sensitive_labels', 0, () => {
      const safe = SecureLabelSanitizer.sanitize('issue list', false);
      expect(safe.label).assertEqual('issue list');
      expect(safe.sensitive).assertFalse();
      const secure = SecureLabelSanitizer.sanitize('13812345678', true);
      expect(secure.label).assertEqual(SECURE_FIELD_DESCRIPTION);
      expect(secure.label.includes('138')).assertFalse();
      expect(secure.sensitive).assertTrue();
      expect(SecureLabelSanitizer.sanitizeDescription('secret', true))
        .assertEqual(SECURE_FIELD_DESCRIPTION);
    });

    it('sanitizer_should_truncate_announcements', 0, () => {
      const longMessage = 'a'.repeat(MAX_ANNOUNCEMENT_LENGTH + 50);
      expect(SecureLabelSanitizer.truncateAnnouncement(longMessage).length)
        .assertEqual(MAX_ANNOUNCEMENT_LENGTH);
      expect(SecureLabelSanitizer.truncateAnnouncement('short')).assertEqual('short');
      expect(SecureLabelSanitizer.truncateAnnouncement('')).assertEqual('');
    });

    it('sanitizer_should_detect_sensitive_announcements', 0, () => {
      expect(SecureLabelSanitizer.containsSensitiveData('token=abc')).assertTrue();
      expect(SecureLabelSanitizer.containsSensitiveData('PASSWORD=1')).assertTrue();
      expect(SecureLabelSanitizer.containsSensitiveData('call 13812345678')).assertTrue();
      expect(SecureLabelSanitizer.containsSensitiveData('issue list opened')).assertFalse();
      expect(SecureLabelSanitizer.containsSensitiveData('')).assertFalse();
    });

    it('secure_window_should_block_capture', 0, () => {
      const policy = new SecureWindowPolicy();
      expect(policy.isSecure()).assertFalse();
      expect(policy.isScreenshotAllowed()).assertTrue();
      expect(policy.canAnnounceSensitive()).assertTrue();
      policy.setSecure(true);
      expect(policy.isSecure()).assertTrue();
      expect(policy.isScreenshotAllowed()).assertFalse();
      expect(policy.canAnnounceSensitive()).assertFalse();
      expect(policy.requiresMaskedDescription()).assertTrue();
      policy.setSecure(false);
      expect(policy.isScreenshotAllowed()).assertTrue();
    });

    it('permission_announcer_should_avoid_secrets', 0, () => {
      const announcer = new PermissionAnnouncer();
      const granted = announcer.announcePermission('READ_MEDIA', true);
      expect(granted).assertEqual('READ_MEDIA permission granted');
      expect(announcer.getCount()).assertEqual(1);
      expect(announcer.latest()).assertEqual('READ_MEDIA permission granted');
      expect(announcer.containsSensitive()).assertFalse();
      announcer.clear();
      expect(announcer.getCount()).assertEqual(0);
      expect(announcer.latest()).assertEqual('');
    });

    it('permission_announcer_should_report_denial', 0, () => {
      const announcer = new PermissionAnnouncer();
      expect(announcer.announcePermission('READ_IMAGEVIDEO', false))
        .assertEqual('READ_IMAGEVIDEO permission denied');
      expect(announcer.containsSensitive()).assertFalse();
      expect(announcer.getCount()).assertEqual(1);
    });

    it('audit_should_flag_sensitive_descriptions', 0, () => {
      const audit = new A11yAudit();
      audit.record({ label: 'issue list', description: 'opens the list', sensitive: false });
      expect(audit.violationCount()).assertEqual(0);
      expect(audit.isClean()).assertTrue();
      audit.record({ label: SECURE_FIELD_DESCRIPTION, description: '13812345678', sensitive: true });
      expect(audit.count()).assertEqual(2);
      expect(audit.sensitiveCount()).assertEqual(1);
      expect(audit.violationCount()).assertEqual(1);
      expect(audit.isClean()).assertFalse();
      audit.reset();
      expect(audit.count()).assertEqual(0);
      expect(audit.isClean()).assertTrue();
    });

    it('secure_flow_should_sanitize_and_audit', 0, () => {
      const policy = new SecureWindowPolicy();
      policy.setSecure(true);
      const audit = new A11yAudit();
      const rawLabel = '13812345678';
      const sanitized = SecureLabelSanitizer.sanitize(rawLabel, policy.requiresMaskedDescription());
      audit.record(sanitized);
      expect(sanitized.label).assertEqual(SECURE_FIELD_DESCRIPTION);
      expect(audit.isClean()).assertTrue();
      expect(audit.violationCount()).assertEqual(0);
      expect(sanitized.label.includes(rawLabel)).assertFalse();
    });

    it('security_a11y_constants_should_be_stable', 0, () => {
      expect(MASK).assertEqual('***');
      expect(SECURE_FIELD_DESCRIPTION).assertEqual('masked field');
      expect(MAX_ANNOUNCEMENT_LENGTH).assertEqual(120);
      expect(MASK.length).assertEqual(3);
      expect(SECURE_FIELD_DESCRIPTION.length).assertLarger(0);
    });
  });
}

