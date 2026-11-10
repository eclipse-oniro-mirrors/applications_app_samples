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

const DEFAULT_MAX_ATTACHMENTS: number = 4;

const MIN_MAX_ATTACHMENTS: number = 1;

const MAX_MAX_ATTACHMENTS: number = 9;

const DEFAULT_MAX_DESCRIPTION: number = 1024;

const DEFAULT_LOG_ENABLED: boolean = true;

const CONFIG_VERSION: string = '1.0.0';

interface IssueConfig {
  maxAttachments: number;
  maxDescriptionLength: number;
  logEnabled: boolean;
  version: string;
}

interface RawConfig {
  maxAttachments?: number;
  maxDescriptionLength?: number;
  logEnabled?: boolean;
  version?: string;
}

// Provides the built-in configuration defaults
class ConfigDefaults {
  public static build(): IssueConfig {
    return {
      maxAttachments: DEFAULT_MAX_ATTACHMENTS,
      maxDescriptionLength: DEFAULT_MAX_DESCRIPTION,
      logEnabled: DEFAULT_LOG_ENABLED,
      version: CONFIG_VERSION
    };
  }

  public static isValid(config: IssueConfig): boolean {
    return config.maxAttachments >= MIN_MAX_ATTACHMENTS &&
      config.maxAttachments <= MAX_MAX_ATTACHMENTS &&
      config.maxDescriptionLength > 0 &&
      config.version.length > 0;
  }
}

// Sanitizes server-provided configuration values
class ConfigParser {
  public static parse(raw: RawConfig): IssueConfig {
    const defaults = ConfigDefaults.build();
    const maxAttachments = raw.maxAttachments === undefined ? defaults.maxAttachments :
      ConfigParser.clampAttachments(raw.maxAttachments);
    const maxDescriptionLength = raw.maxDescriptionLength === undefined ? defaults.maxDescriptionLength :
      ConfigParser.sanitizeDescriptionLength(raw.maxDescriptionLength);
    return {
      maxAttachments: maxAttachments,
      maxDescriptionLength: maxDescriptionLength,
      logEnabled: raw.logEnabled === undefined ? defaults.logEnabled : raw.logEnabled,
      version: raw.version === undefined || raw.version.length === 0 ? defaults.version : raw.version
    };
  }

  public static clampAttachments(value: number): number {
    if (value < MIN_MAX_ATTACHMENTS) {
      return MIN_MAX_ATTACHMENTS;
    }
    if (value > MAX_MAX_ATTACHMENTS) {
      return MAX_MAX_ATTACHMENTS;
    }
    return Math.floor(value);
  }

  public static sanitizeDescriptionLength(value: number): number {
    if (value <= 0) {
      return DEFAULT_MAX_DESCRIPTION;
    }
    return Math.floor(value);
  }

  public static isVersionValid(version: string): boolean {
    const pattern: RegExp = new RegExp('^[0-9]+(\\.[0-9]+)*$');
    return pattern.test(version);
  }
}

// Merges server configuration over cached configuration
class ConfigMerger {
  public static merge(cached: IssueConfig, remote: IssueConfig): IssueConfig {
    return {
      maxAttachments: remote.maxAttachments > 0 ? remote.maxAttachments : cached.maxAttachments,
      maxDescriptionLength: remote.maxDescriptionLength > 0 ? remote.maxDescriptionLength :
        cached.maxDescriptionLength,
      logEnabled: remote.logEnabled,
      version: remote.version.length > 0 ? remote.version : cached.version
    };
  }

  public static isNewer(remoteVersion: string, cachedVersion: string): boolean {
    return ConfigMerger.compareVersions(remoteVersion, cachedVersion) > 0;
  }

  public static compareVersions(left: string, right: string): number {
    const leftParts = left.split('.');
    const rightParts = right.split('.');
    const count = Math.max(leftParts.length, rightParts.length);
    for (let i = 0; i < count; i++) {
      const leftValue = i < leftParts.length ? Number(leftParts[i]) : 0;
      const rightValue = i < rightParts.length ? Number(rightParts[i]) : 0;
      if (leftValue > rightValue) {
        return 1;
      }
      if (leftValue < rightValue) {
        return -1;
      }
    }
    return 0;
  }
}

// Applies configuration limits to user input
class ConfigEnforcer {
  public static canAddAttachment(config: IssueConfig, currentCount: number): boolean {
    return currentCount >= 0 && currentCount < config.maxAttachments;
  }

  public static canTypeDescription(config: IssueConfig, currentLength: number): boolean {
    return currentLength >= 0 && currentLength < config.maxDescriptionLength;
  }

  public static remainingDescription(config: IssueConfig, currentLength: number): number {
    const remaining = config.maxDescriptionLength - currentLength;
    return remaining < 0 ? 0 : remaining;
  }

  public static shouldCollectLogs(config: IssueConfig): boolean {
    return config.logEnabled;
  }
}

// Tracks configuration changes for audit
class ConfigChangeLog {
  private versions: string[] = [];
  private readonly capacity: number;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public record(version: string): boolean {
    if (version.length === 0 || this.capacity <= 0) {
      return false;
    }
    if (this.versions.length >= this.capacity) {
      this.versions.shift();
    }
    this.versions.push(version);
    return true;
  }

  public count(): number {
    return this.versions.length;
  }

  public latest(): string {
    return this.versions.length === 0 ? '' : this.versions[this.versions.length - 1];
  }

  public contains(version: string): boolean {
    return this.versions.includes(version);
  }

  public all(): string[] {
    return [...this.versions];
  }

  public clear(): void {
    this.versions = [];
  }
}

export default function issueConfigurationValidationTest() {
  describe('IssueConfigurationValidation_Test', () => {

    it('defaults_should_be_valid', 0, () => {
      const config = ConfigDefaults.build();
      expect(ConfigDefaults.isValid(config)).assertTrue();
      expect(config.maxAttachments).assertEqual(DEFAULT_MAX_ATTACHMENTS);
      expect(config.maxDescriptionLength).assertEqual(DEFAULT_MAX_DESCRIPTION);
      expect(config.logEnabled).assertTrue();
      expect(config.version).assertEqual(CONFIG_VERSION);
    });

    it('parser_should_apply_defaults_for_missing_fields', 0, () => {
      const config = ConfigParser.parse({});
      expect(config.maxAttachments).assertEqual(DEFAULT_MAX_ATTACHMENTS);
      expect(config.maxDescriptionLength).assertEqual(DEFAULT_MAX_DESCRIPTION);
      expect(config.logEnabled).assertTrue();
      expect(config.version).assertEqual(CONFIG_VERSION);
    });

    it('parser_should_accept_remote_values', 0, () => {
      const config = ConfigParser.parse({
        maxAttachments: 6,
        maxDescriptionLength: 2048,
        logEnabled: false,
        version: '1.2.0'
      });
      expect(config.maxAttachments).assertEqual(6);
      expect(config.maxDescriptionLength).assertEqual(2048);
      expect(config.logEnabled).assertFalse();
      expect(config.version).assertEqual('1.2.0');
      expect(ConfigDefaults.isValid(config)).assertTrue();
    });

    it('parser_should_clamp_attachment_limits', 0, () => {
      expect(ConfigParser.parse({ maxAttachments: 0 }).maxAttachments)
        .assertEqual(MIN_MAX_ATTACHMENTS);
      expect(ConfigParser.parse({ maxAttachments: -5 }).maxAttachments)
        .assertEqual(MIN_MAX_ATTACHMENTS);
      expect(ConfigParser.parse({ maxAttachments: MAX_MAX_ATTACHMENTS + 10 }).maxAttachments)
        .assertEqual(MAX_MAX_ATTACHMENTS);
      expect(ConfigParser.clampAttachments(4.9)).assertEqual(4);
    });

    it('parser_should_sanitize_description_length', 0, () => {
      expect(ConfigParser.parse({ maxDescriptionLength: 0 }).maxDescriptionLength)
        .assertEqual(DEFAULT_MAX_DESCRIPTION);
      expect(ConfigParser.parse({ maxDescriptionLength: -1 }).maxDescriptionLength)
        .assertEqual(DEFAULT_MAX_DESCRIPTION);
      expect(ConfigParser.sanitizeDescriptionLength(2048.7)).assertEqual(2048);
      expect(ConfigParser.sanitizeDescriptionLength(512)).assertEqual(512);
    });

    it('parser_should_validate_versions', 0, () => {
      expect(ConfigParser.isVersionValid('1.0.0')).assertTrue();
      expect(ConfigParser.isVersionValid('2')).assertTrue();
      expect(ConfigParser.isVersionValid('1.0.x')).assertFalse();
      expect(ConfigParser.isVersionValid('')).assertFalse();
      expect(ConfigParser.parse({ version: '' }).version).assertEqual(CONFIG_VERSION);
    });

    it('merger_should_prefer_remote_limits', 0, () => {
      const cached = ConfigDefaults.build();
      const remote = ConfigParser.parse({
        maxAttachments: 2, maxDescriptionLength: 512, logEnabled: false, version: '1.1.0'
      });
      const merged = ConfigMerger.merge(cached, remote);
      expect(merged.maxAttachments).assertEqual(2);
      expect(merged.maxDescriptionLength).assertEqual(512);
      expect(merged.logEnabled).assertFalse();
      expect(merged.version).assertEqual('1.1.0');
    });

    it('merger_should_keep_cache_for_zero_limits', 0, () => {
      const cached = ConfigParser.parse({
        maxAttachments: 3, maxDescriptionLength: 800, logEnabled: true, version: '1.0.5'
      });
      const remote: IssueConfig = {
        maxAttachments: 0, maxDescriptionLength: 0, logEnabled: true, version: ''
      };
      const merged = ConfigMerger.merge(cached, remote);
      expect(merged.maxAttachments).assertEqual(3);
      expect(merged.maxDescriptionLength).assertEqual(800);
      expect(merged.version).assertEqual('1.0.5');
    });

    it('merger_should_compare_versions', 0, () => {
      expect(ConfigMerger.compareVersions('1.0.0', '1.0.0')).assertEqual(0);
      expect(ConfigMerger.compareVersions('1.1.0', '1.0.0')).assertEqual(1);
      expect(ConfigMerger.compareVersions('1.0.0', '1.1.0')).assertEqual(-1);
      expect(ConfigMerger.isNewer('1.1.0', '1.0.0')).assertTrue();
      expect(ConfigMerger.isNewer('1.0.0', '1.0.0')).assertFalse();
      expect(ConfigMerger.isNewer('1.0', '1.0.0')).assertFalse();
    });

    it('enforcer_should_limit_attachments', 0, () => {
      const config = ConfigDefaults.build();
      expect(ConfigEnforcer.canAddAttachment(config, 0)).assertTrue();
      expect(ConfigEnforcer.canAddAttachment(config, 3)).assertTrue();
      expect(ConfigEnforcer.canAddAttachment(config, 4)).assertFalse();
      expect(ConfigEnforcer.canAddAttachment(config, -1)).assertFalse();
    });

    it('enforcer_should_limit_description', 0, () => {
      const config = ConfigParser.parse({ maxDescriptionLength: 100 });
      expect(ConfigEnforcer.canTypeDescription(config, 99)).assertTrue();
      expect(ConfigEnforcer.canTypeDescription(config, 100)).assertFalse();
      expect(ConfigEnforcer.remainingDescription(config, 40)).assertEqual(60);
      expect(ConfigEnforcer.remainingDescription(config, 120)).assertEqual(0);
      expect(ConfigEnforcer.shouldCollectLogs(config)).assertTrue();
    });

    it('change_log_should_track_versions', 0, () => {
      const log = new ConfigChangeLog(3);
      expect(log.record('1.0.0')).assertTrue();
      expect(log.record('1.1.0')).assertTrue();
      expect(log.record('')).assertFalse();
      expect(log.count()).assertEqual(2);
      expect(log.latest()).assertEqual('1.1.0');
      expect(log.contains('1.0.0')).assertTrue();
      log.record('1.2.0');
      log.record('1.3.0');
      expect(log.count()).assertEqual(3);
      expect(log.contains('1.0.0')).assertFalse();
      expect(log.all().length).assertEqual(3);
      log.clear();
      expect(log.count()).assertEqual(0);
    });

    it('configuration_flow_should_apply_and_enforce', 0, () => {
      const cached = ConfigDefaults.build();
      const remote = ConfigParser.parse({
        maxAttachments: 2, maxDescriptionLength: 256, logEnabled: true, version: '1.4.0'
      });
      const newer = ConfigMerger.isNewer(remote.version, cached.version);
      expect(newer).assertTrue();
      const active = ConfigMerger.merge(cached, remote);
      const log = new ConfigChangeLog(5);
      if (newer) {
        log.record(active.version);
      }
      expect(active.maxAttachments).assertEqual(2);
      expect(ConfigEnforcer.canAddAttachment(active, 1)).assertTrue();
      expect(ConfigEnforcer.canAddAttachment(active, 2)).assertFalse();
      expect(ConfigEnforcer.remainingDescription(active, 200)).assertEqual(56);
      expect(log.latest()).assertEqual('1.4.0');
    });

    it('configuration_constants_should_be_stable', 0, () => {
      expect(DEFAULT_MAX_ATTACHMENTS).assertEqual(4);
      expect(MIN_MAX_ATTACHMENTS).assertEqual(1);
      expect(MAX_MAX_ATTACHMENTS).assertEqual(9);
      expect(DEFAULT_MAX_DESCRIPTION).assertEqual(1024);
      expect(DEFAULT_LOG_ENABLED).assertTrue();
      expect(CONFIG_VERSION).assertEqual('1.0.0');
    });
  });
}

