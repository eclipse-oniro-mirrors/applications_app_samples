'use static';

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

/**
 * Permission and sanitisation models for the security suites. The sample has
 * no real network surface, so the suites assert the policy the pages rely on:
 * which roles may mutate calendar data and what text may reach a log line.
 */
export class RolePolicy {
  public static readonly ROLES: string[] = ['viewer', 'editor', 'owner'];

  public static canMutate(role: string): boolean {
    return role === 'editor' || role === 'owner';
  }

  public static canExport(role: string): boolean {
    return role === 'owner';
  }

  public static rank(role: string): int {
    for (let index = 0; index < RolePolicy.ROLES.length; index++) {
      if (RolePolicy.ROLES[index] === role) {
        return index;
      }
    }
    return -1;
  }

  public static atLeast(role: string, required: string): boolean {
    return RolePolicy.rank(role) >= RolePolicy.rank(required) && RolePolicy.rank(role) >= 0;
  }
}

export class Sanitizer {
  /** Rejects control characters and trims surrounding blanks. */
  public static clean(text: string): string {
    const trimmed: string = Sanitizer.trim(text);
    let result: string = '';
    for (let index = 0; index < trimmed.length; index++) {
      const code: number = trimmed.charCodeAt(index);
      if (code >= 32 && code !== 127) {
        result = result + trimmed.charAt(index);
      }
    }
    return result;
  }

  public static trim(text: string): string {
    let start: int = 0;
    let end: int = text.length;
    while (start < end && text.charAt(start).toString() === ' ') {
      start = start + 1;
    }
    while (end > start && text.charAt(end - 1).toString() === ' ') {
      end = end - 1;
    }
    return text.substring(start, end);
  }

  public static maskAccount(account: string): string {
    if (account.length <= 2) {
      return '**';
    }
    return account.charAt(0) + '***' + account.charAt(account.length - 1);
  }

  public static isSafeForLog(text: string): boolean {
    const lowered: string = text.toLowerCase();
    if (lowered.indexOf('password') >= 0 || lowered.indexOf('token') >= 0 || lowered.indexOf('secret') >= 0) {
      return false;
    }
    return Sanitizer.clean(text) === text;
  }
}

/** Sliding window limiter used by the input validation suites. */
export class RateLimiter {
  public limit: int;
  public windowMs: int;
  public hits: int[] = [];

  constructor(limit: int, windowMs: int) {
    this.limit = limit;
    this.windowMs = windowMs;
  }

  public allow(nowMs: int): boolean {
    const kept: int[] = [];
    for (let index = 0; index < this.hits.length; index++) {
      if (nowMs - this.hits[index] < this.windowMs) {
        kept.push(this.hits[index]);
      }
    }
    this.hits = kept;
    if (this.hits.length >= this.limit) {
      return false;
    }
    this.hits.push(nowMs);
    return true;
  }
}

/** Token bucket for the refresh action. */
export class TokenBucket {
  public capacity: int;
  public tokens: int;

  constructor(capacity: int) {
    this.capacity = capacity;
    this.tokens = capacity;
  }

  public take(count: int): boolean {
    if (count <= 0) {
      return false;
    }
    if (this.tokens < count) {
      return false;
    }
    this.tokens = this.tokens - count;
    return true;
  }

  public refill(count: int): void {
    this.tokens = this.tokens + count;
    if (this.tokens > this.capacity) {
      this.tokens = this.capacity;
    }
  }
}

/** Append only audit trail kept in memory during a test run. */
export class AuditTrail {
  public entries: string[] = [];

  public record(actor: string, action: string, allowed: boolean): void {
    this.entries.push(actor + '|' + action + '|' + (allowed ? 'allow' : 'deny'));
  }

  public denied(): int {
    let total: int = 0;
    for (let index = 0; index < this.entries.length; index++) {
      if (this.entries[index].endsWith('|deny')) {
        total = total + 1;
      }
    }
    return total;
  }

  public allowed(): int {
    let total: int = 0;
    for (let index = 0; index < this.entries.length; index++) {
      if (this.entries[index].endsWith('|allow')) {
        total = total + 1;
      }
    }
    return total;
  }

  public tail(): string {
    if (this.entries.length === 0) {
      return '';
    }
    return this.entries[this.entries.length - 1];
  }
}
