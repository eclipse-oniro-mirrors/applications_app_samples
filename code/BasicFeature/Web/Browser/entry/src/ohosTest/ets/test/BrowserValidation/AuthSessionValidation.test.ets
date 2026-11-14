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

import { describe, it, expect, beforeAll, afterAll, beforeEach } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import TestLogger from '../Shared/TestLogger';
import {
  getDriver, startBrowserApp, componentByIdExists, waitForId, countById,
  ID_INPUT_URL, ID_ACTION_SUBMIT, TIMEOUT_COMPONENT
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockClock, MockNetwork } from '../Shared/BrowserMock';

const TAG: string = 'BrowserAuthSessionValidationTest';

/* ------------------------------------------------------------------ */
/* Session constants                                                   */
/* ------------------------------------------------------------------ */

/** Session lifetime granted by the sample identity service. */
const SESSION_TTL_MS: number = 3600000;

/** Refresh window: a token closer than this to expiry is renewed. */
const RENEW_WINDOW_MS: number = 300000;

/** Token lifetime after a successful renewal. */
const RENEWED_TTL_MS: number = 7200000;

/** Authorization scheme used by every authenticated request. */
const BEARER_SCHEME: string = 'Bearer';

/** Header carrying the bearer token. */
const AUTH_HEADER: string = 'Authorization';

/** Header carrying the serialized cookie jar. */
const COOKIE_HEADER: string = 'Cookie';

/** Placeholder printed instead of any secret material. */
const REDACTED: string = '***';

/** Origin used by the sample login page. */
const LOGIN_ORIGIN: string = 'https://passport.example.com';

/** Origin of the browser start page. */
const PORTAL_ORIGIN: string = 'https://www.example.com';

/** Origin belonging to a different tenant, used for isolation checks. */
const TENANT_ORIGIN: string = 'https://tenant.example.org';

/** Session cookie issued after a successful login. */
const SESSION_COOKIE_NAME: string = 'SESSIONID';

/** Short lived anti forgery cookie. */
const CSRF_COOKIE_NAME: string = 'csrf_token';

/** Refresh token cookie, only ever sent over https. */
const REFRESH_COOKIE_NAME: string = 'refresh_token';

/** Path prefix protected by the login gate. */
const PROTECTED_PATH: string = '/account';

/* ------------------------------------------------------------------ */
/* Cookie model                                                        */
/* ------------------------------------------------------------------ */

/** One HTTP cookie as stored by the browser cookie jar. */
class Cookie {
  name: string;
  value: string;
  domain: string;
  path: string;
  secure: boolean;
  httpOnly: boolean;
  expiresAt: number;
  sameSite: string;

  constructor(name: string, value: string, domain: string, path: string, secure: boolean,
    httpOnly: boolean, expiresAt: number, sameSite: string) {
    this.name = name;
    this.value = value;
    this.domain = Cookie.normalizeDomain(domain);
    this.path = path.length === 0 ? '/' : path;
    this.secure = secure;
    this.httpOnly = httpOnly;
    this.expiresAt = expiresAt;
    this.sameSite = sameSite;
  }

  /** Strips the legacy leading dot so domain matching stays symmetric. */
  static normalizeDomain(domain: string): string {
    if (domain === null || domain === undefined) {
      return '';
    }
    const text: string = domain.trim().toLowerCase();
    if (text.length > 0 && text.charAt(0) === '.') {
      return text.substring(1);
    }
    return text;
  }

  /** Session cookies carry expiresAt <= 0 and die with the tab. */
  isSessionCookie(): boolean {
    return this.expiresAt <= 0;
  }

  isExpired(now: number): boolean {
    return this.expiresAt > 0 && now >= this.expiresAt;
  }

  /** Host-only or suffix match of the request host. */
  matchesDomain(host: string): boolean {
    const target: string = Cookie.normalizeDomain(host);
    if (this.domain.length === 0 || target.length === 0) {
      return false;
    }
    if (target === this.domain) {
      return true;
    }
    const suffix: string = '.' + this.domain;
    if (target.length <= suffix.length) {
      return false;
    }
    return target.substring(target.length - suffix.length) === suffix;
  }

  /** RFC 6265 prefix match, '/' matches everything. */
  matchesPath(requestPath: string): boolean {
    const target: string = requestPath === null || requestPath === undefined ||
      requestPath.length === 0 ? '/' : requestPath;
    if (this.path === '/') {
      return true;
    }
    if (target === this.path) {
      return true;
    }
    if (target.length <= this.path.length) {
      return false;
    }
    return target.substring(0, this.path.length) === this.path &&
      target.charAt(this.path.length) === '/';
  }

  /** True when the cookie must not be attached to the given host. */
  isCrossDomain(host: string): boolean {
    return !this.matchesDomain(host);
  }

  /** name=value pair sent on the wire. */
  toHeader(): string {
    return `${this.name}=${this.value}`;
  }

  /** Attribute suffix, used by the Set-Cookie round trip test. */
  attributes(): string {
    const parts: string[] = [];
    parts.push(`Domain=${this.domain}`);
    parts.push(`Path=${this.path}`);
    if (this.secure) {
      parts.push('Secure');
    }
    if (this.httpOnly) {
      parts.push('HttpOnly');
    }
    if (this.sameSite.length > 0) {
      parts.push(`SameSite=${this.sameSite}`);
    }
    return parts.join('; ');
  }

  /** Identity of the cookie inside the jar: name + domain + path. */
  key(): string {
    return `${this.name}|${this.domain}|${this.path}`;
  }

  copyWithValue(value: string): Cookie {
    return new Cookie(this.name, value, this.domain, this.path, this.secure, this.httpOnly,
      this.expiresAt, this.sameSite);
  }
}

/* ------------------------------------------------------------------ */
/* Cookie jar                                                          */
/* ------------------------------------------------------------------ */

/**
 * Deterministic cookie jar mirroring the Web engine store.
 *
 * Every write is validated against the requesting host, so a page of one
 * origin can never plant a cookie that is later sent to another origin.
 */
class CookieJar {
  cookies: Cookie[] = [];
  rejected: string[] = [];

  /** Writes a cookie, returning false when the host is not allowed. */
  set(cookie: Cookie, host: string, now: number): boolean {
    if (cookie.name.length === 0) {
      this.rejected.push('empty-name');
      return false;
    }
    if (cookie.isCrossDomain(host)) {
      this.rejected.push(`${cookie.name}@${cookie.domain}`);
      return false;
    }
    if (cookie.isExpired(now)) {
      this.rejected.push(`${cookie.name}:expired`);
      return false;
    }
    const key: string = cookie.key();
    for (let index = 0; index < this.cookies.length; index++) {
      if (this.cookies[index].key() === key) {
        this.cookies[index] = cookie;
        return true;
      }
    }
    this.cookies.push(cookie);
    return true;
  }

  indexOfKey(name: string, host: string, path: string): number {
    for (let index = 0; index < this.cookies.length; index++) {
      const cookie: Cookie = this.cookies[index];
      if (cookie.name === name && cookie.matchesDomain(host) && cookie.matchesPath(path)) {
        return index;
      }
    }
    return -1;
  }

  get(name: string, host: string, path: string, now: number): Cookie | null {
    const index: number = this.indexOfKey(name, host, path);
    if (index < 0) {
      return null;
    }
    const cookie: Cookie = this.cookies[index];
    if (cookie.isExpired(now)) {
      return null;
    }
    return cookie;
  }

  /** Every live cookie that may be attached to host + path. */
  getAllFor(host: string, path: string, now: number): Cookie[] {
    const result: Cookie[] = [];
    for (let index = 0; index < this.cookies.length; index++) {
      const cookie: Cookie = this.cookies[index];
      if (cookie.matchesDomain(host) && cookie.matchesPath(path) && !cookie.isExpired(now)) {
        result.push(cookie);
      }
    }
    return result;
  }

  /** Serialized Cookie header, empty string when nothing applies. */
  toRequestHeader(host: string, path: string, now: number): string {
    const applicable: Cookie[] = this.getAllFor(host, path, now);
    const parts: string[] = [];
    for (let index = 0; index < applicable.length; index++) {
      parts.push(applicable[index].toHeader());
    }
    return parts.join('; ');
  }

  remove(name: string, host: string, path: string): boolean {
    const index: number = this.indexOfKey(name, host, path);
    if (index < 0) {
      return false;
    }
    this.cookies.splice(index, 1);
    return true;
  }

  /** Drops every cookie of a domain, used by logout. */
  removeDomain(domain: string): number {
    const target: string = Cookie.normalizeDomain(domain);
    const kept: Cookie[] = [];
    let removed: number = 0;
    for (let index = 0; index < this.cookies.length; index++) {
      if (this.cookies[index].domain === target) {
        removed += 1;
      } else {
        kept.push(this.cookies[index]);
      }
    }
    this.cookies = kept;
    return removed;
  }

  purgeExpired(now: number): number {
    const kept: Cookie[] = [];
    let removed: number = 0;
    for (let index = 0; index < this.cookies.length; index++) {
      if (this.cookies[index].isExpired(now)) {
        removed += 1;
      } else {
        kept.push(this.cookies[index]);
      }
    }
    this.cookies = kept;
    return removed;
  }

  size(): number {
    return this.cookies.length;
  }

  rejectedCount(): number {
    return this.rejected.length;
  }

  lastRejected(): string {
    if (this.rejected.length === 0) {
      return '';
    }
    return this.rejected[this.rejected.length - 1];
  }

  clear(): void {
    this.cookies = [];
    this.rejected = [];
  }

  names(): string[] {
    return this.cookies.map((cookie: Cookie) => cookie.name);
  }

  /** Number of httpOnly cookies, they must never reach script. */
  httpOnlyCount(): number {
    let count: number = 0;
    for (let index = 0; index < this.cookies.length; index++) {
      if (this.cookies[index].httpOnly) {
        count += 1;
      }
    }
    return count;
  }

  secureCount(): number {
    let count: number = 0;
    for (let index = 0; index < this.cookies.length; index++) {
      if (this.cookies[index].secure) {
        count += 1;
      }
    }
    return count;
  }
}

/* ------------------------------------------------------------------ */
/* Bearer token                                                        */
/* ------------------------------------------------------------------ */

/** Bearer token with an explicit lifetime and scope list. */
class AuthToken {
  value: string;
  issuedAt: number;
  expiresAt: number;
  scopes: string[];

  constructor(value: string, issuedAt: number, expiresAt: number, scopes: string[]) {
    this.value = value;
    this.issuedAt = issuedAt;
    this.expiresAt = expiresAt;
    this.scopes = scopes;
  }

  /** Builds the token shipped with the sample login fixture. */
  static fixture(now: number): AuthToken {
    return new AuthToken('eyJhbGciOiJIUzI1NiJ9.sample-payload.signature', now,
      now + SESSION_TTL_MS, ['browser.read', 'browser.history', 'account.read']);
  }

  isExpired(now: number): boolean {
    return now >= this.expiresAt;
  }

  isValid(now: number): boolean {
    return this.value.length > 0 && !this.isExpired(now);
  }

  hasScope(scope: string): boolean {
    return this.scopes.indexOf(scope) >= 0;
  }

  /** Milliseconds left before expiry, never negative. */
  remaining(now: number): number {
    if (this.isExpired(now)) {
      return 0;
    }
    return this.expiresAt - now;
  }

  /** True once the token enters the refresh window. */
  shouldRenew(now: number): boolean {
    const left: number = this.remaining(now);
    return left > 0 && left <= RENEW_WINDOW_MS;
  }

  /** Issues a replacement token with a fresh lifetime. */
  renew(now: number): AuthToken {
    return new AuthToken(this.value, now, now + RENEWED_TTL_MS, this.scopes.slice(0));
  }

  /** Only the first four characters survive any log statement. */
  masked(): string {
    if (this.value.length <= 4) {
      return REDACTED;
    }
    return `${this.value.substring(0, 4)}${REDACTED}`;
  }

  withScope(scope: string): AuthToken {
    const next: string[] = this.scopes.slice(0);
    if (next.indexOf(scope) < 0) {
      next.push(scope);
    }
    return new AuthToken(this.value, this.issuedAt, this.expiresAt, next);
  }
}

/** Builds and records the authorization header of each request. */
class BearerInjector {
  headers: string[] = [];
  rejected: number = 0;

  /** "Bearer <token>" or an empty string when the token is unusable. */
  buildHeader(token: AuthToken, now: number): string {
    if (token === null || token === undefined || !token.isValid(now)) {
      this.rejected += 1;
      return '';
    }
    return `${BEARER_SCHEME} ${token.value}`;
  }

  /** Full header line, empty when there is nothing to inject. */
  inject(token: AuthToken, now: number): string {
    const header: string = this.buildHeader(token, now);
    if (header.length === 0) {
      return '';
    }
    const line: string = `${AUTH_HEADER}: ${header}`;
    this.headers.push(line);
    return line;
  }

  /** Adds the authorization header in front of the caller headers. */
  requestHeaders(token: AuthToken, now: number, extra: string[]): string[] {
    const result: string[] = [];
    const line: string = this.inject(token, now);
    if (line.length > 0) {
      result.push(line);
    }
    for (let index = 0; index < extra.length; index++) {
      result.push(extra[index]);
    }
    return result;
  }

  headerCount(): number {
    return this.headers.length;
  }

  lastHeader(): string {
    if (this.headers.length === 0) {
      return '';
    }
    return this.headers[this.headers.length - 1];
  }

  rejectedCount(): number {
    return this.rejected;
  }

  reset(): void {
    this.headers = [];
    this.rejected = 0;
  }
}

/* ------------------------------------------------------------------ */
/* Per tab session state                                               */
/* ------------------------------------------------------------------ */

/** Session of a single browser tab: its token and its private jar. */
class TabSession {
  tabIndex: number;
  token: AuthToken | null = null;
  jar: CookieJar = new CookieJar();
  loginCount: number = 0;
  logoutCount: number = 0;

  constructor(tabIndex: number) {
    this.tabIndex = tabIndex;
  }

  login(token: AuthToken): boolean {
    if (token === null || token === undefined || token.value.length === 0) {
      return false;
    }
    this.token = token;
    this.loginCount += 1;
    this.jar.set(new Cookie(SESSION_COOKIE_NAME, token.masked(), PORTAL_ORIGIN, '/', true,
      true, 0, 'Lax'), PORTAL_ORIGIN, token.issuedAt);
    return true;
  }

  logout(): number {
    this.logoutCount += 1;
    this.token = null;
    const removed: number = this.jar.size();
    this.jar.clear();
    return removed;
  }

  isLoggedIn(now: number): boolean {
    if (this.token === null) {
      return false;
    }
    return this.token.isValid(now);
  }

  tokenValue(): string {
    return this.token === null ? '' : this.token.value;
  }

  cookieCount(): number {
    return this.jar.size();
  }

  /** True when the tab can reach a protected path right now. */
  canReachProtected(now: number): boolean {
    if (!this.isLoggedIn(now)) {
      return false;
    }
    const cookie: Cookie | null = this.jar.get(SESSION_COOKIE_NAME, PORTAL_ORIGIN,
      PROTECTED_PATH, now);
    return cookie !== null;
  }

  snapshot(): string {
    return `tab${this.tabIndex}:logged=${this.isLoggedIn(this.token === null ? 0 : this.token.issuedAt)}` +
      `:cookies=${this.jar.size()}`;
  }
}

/** Registry owning one isolated session per tab. */
class SessionRegistry {
  sessions: TabSession[] = [];

  constructor(tabCount: number) {
    const count: number = tabCount <= 0 ? 1 : tabCount;
    for (let index = 0; index < count; index++) {
      this.sessions.push(new TabSession(index));
    }
  }

  sessionAt(index: number): TabSession | null {
    if (index < 0 || index >= this.sessions.length) {
      return null;
    }
    return this.sessions[index];
  }

  size(): number {
    return this.sessions.length;
  }

  loginAt(index: number, token: AuthToken): boolean {
    const session: TabSession | null = this.sessionAt(index);
    if (session === null) {
      return false;
    }
    return session.login(token);
  }

  logoutAt(index: number): number {
    const session: TabSession | null = this.sessionAt(index);
    if (session === null) {
      return 0;
    }
    return session.logout();
  }

  /** Logout everywhere, returns the number of tabs that were signed in. */
  logoutAll(): number {
    let signedOut: number = 0;
    for (let index = 0; index < this.sessions.length; index++) {
      if (this.sessions[index].token !== null) {
        signedOut += 1;
      }
      this.sessions[index].logout();
    }
    return signedOut;
  }

  loggedInCount(now: number): number {
    let count: number = 0;
    for (let index = 0; index < this.sessions.length; index++) {
      if (this.sessions[index].isLoggedIn(now)) {
        count += 1;
      }
    }
    return count;
  }

  /** True when no two tabs share the same token value. */
  isIsolated(): boolean {
    const seen: string[] = [];
    for (let index = 0; index < this.sessions.length; index++) {
      const value: string = this.sessions[index].tokenValue();
      if (value.length === 0) {
        continue;
      }
      if (seen.indexOf(value) >= 0) {
        return false;
      }
      seen.push(value);
    }
    return true;
  }

  /** Number of tabs whose cookie jar still holds a cookie. */
  tabsWithCookies(): number {
    let count: number = 0;
    for (let index = 0; index < this.sessions.length; index++) {
      if (this.sessions[index].cookieCount() > 0) {
        count += 1;
      }
    }
    return count;
  }

  totalCookies(): number {
    let total: number = 0;
    for (let index = 0; index < this.sessions.length; index++) {
      total += this.sessions[index].cookieCount();
    }
    return total;
  }
}

/* ------------------------------------------------------------------ */
/* Sensitive log guard                                                 */
/* ------------------------------------------------------------------ */

/** Redacts credentials before a line reaches the log sink. */
class SensitiveLogGuard {
  safeLines: string[] = [];
  leakedTokens: number = 0;
  leakedCookies: number = 0;

  /** Rewrites "Bearer <secret>" and "Cookie: <secret>" to a placeholder. */
  redact(line: string): string {
    let result: string = line;
    result = this.redactAfter(result, `${BEARER_SCHEME} `);
    result = this.redactAfter(result, `${COOKIE_HEADER}: `);
    result = this.redactAfter(result, `${SESSION_COOKIE_NAME}=`);
    return result;
  }

  /** Keeps text up to the marker, then replaces the rest of that segment. */
  private redactAfter(line: string, marker: string): string {
    const position: number = line.indexOf(marker);
    if (position < 0) {
      return line;
    }
    const head: string = line.substring(0, position + marker.length);
    let tail: string = line.substring(position + marker.length);
    const separator: number = tail.indexOf(' ');
    if (separator >= 0) {
      tail = tail.substring(separator);
    } else {
      tail = '';
    }
    return `${head}${REDACTED}${tail}`;
  }

  record(line: string): string {
    const safe: string = this.redact(line);
    this.safeLines.push(safe);
    if (safe.indexOf(REDACTED) < 0 && line.length > 0) {
      this.leakedTokens += 1;
    }
    return safe;
  }

  recordHeaders(headers: string[]): string[] {
    const result: string[] = [];
    for (let index = 0; index < headers.length; index++) {
      result.push(this.record(headers[index]));
    }
    return result;
  }

  contains(secret: string): boolean {
    for (let index = 0; index < this.safeLines.length; index++) {
      if (this.safeLines[index].indexOf(secret) >= 0) {
        return true;
      }
    }
    return false;
  }

  lineCount(): number {
    return this.safeLines.length;
  }

  lastLine(): string {
    if (this.safeLines.length === 0) {
      return '';
    }
    return this.safeLines[this.safeLines.length - 1];
  }

  reset(): void {
    this.safeLines = [];
    this.leakedTokens = 0;
    this.leakedCookies = 0;
  }
}

/* ------------------------------------------------------------------ */
/* Fixtures                                                            */
/* ------------------------------------------------------------------ */

/** Session cookie issued to the portal origin. */
function sessionCookie(value: string, expiresAt: number): Cookie {
  return new Cookie(SESSION_COOKIE_NAME, value, PORTAL_ORIGIN, '/', true, true, expiresAt, 'Lax');
}

/** Anti forgery cookie scoped to the protected path. */
function csrfCookie(value: string, expiresAt: number): Cookie {
  return new Cookie(CSRF_COOKIE_NAME, value, PORTAL_ORIGIN, PROTECTED_PATH, true, false,
    expiresAt, 'Strict');
}

/** Refresh cookie scoped to the login origin only. */
function refreshCookie(value: string, expiresAt: number): Cookie {
  return new Cookie(REFRESH_COOKIE_NAME, value, LOGIN_ORIGIN, '/', true, true, expiresAt, 'Strict');
}

/** Cookie planted by a hostile origin, must always be refused. */
function hostileCookie(value: string, domain: string): Cookie {
  return new Cookie('tracking', value, domain, '/', false, false, 0, 'None');
}

/** Distinct token per tab so isolation can be asserted by value. */
function tokenForTab(index: number, now: number): AuthToken {
  return new AuthToken(`token-tab-${index}-${now}`, now, now + SESSION_TTL_MS,
    ['browser.read', 'account.read']);
}

/** Token fixture mirroring the sample login page response. */
function fixtureToken(now: number): AuthToken {
  return new AuthToken('eyJhbGciOiJIUzI1NiJ9.sample-payload.signature', now,
    now + SESSION_TTL_MS, ['browser.read', 'browser.history', 'account.read']);
}

/** True when a header line starts with the authorization scheme. */
function isAuthorizationLine(line: string): boolean {
  return line.indexOf(`${AUTH_HEADER}: ${BEARER_SCHEME} `) === 0;
}

/** Splits a Cookie header into its name=value pairs. */
function cookiePairs(header: string): string[] {
  if (header.length === 0) {
    return [];
  }
  return header.split('; ');
}

/** Looks up one pair by name inside a serialized Cookie header. */
function pairValue(header: string, name: string): string {
  const pairs: string[] = cookiePairs(header);
  const prefix: string = `${name}=`;
  for (let index = 0; index < pairs.length; index++) {
    if (pairs[index].indexOf(prefix) === 0) {
      return pairs[index].substring(prefix.length);
    }
  }
  return '';
}

/** Number of live cookies a request to the portal root would carry. */
function cookiePairCount(jar: CookieJar): number {
  return cookiePairs(jar.toRequestHeader(PORTAL_ORIGIN, '/', 0)).length;
}

/* ------------------------------------------------------------------ */
/* Suite                                                               */
/* ------------------------------------------------------------------ */

export default function browserAuthSessionValidationTest() {
  describe('browserAuthSessionValidationTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'suite begin: cookie, bearer token and session lifecycle');
      await startBrowserApp();
      TestLogger.info(TAG, 'browser app started for auth validation');
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    beforeEach(() => {
      TestLogger.resetSteps(TAG);
    });

    /** A cookie written by its own origin is readable again. */
    it('Auth_Cookie_SetGet_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Auth_Cookie_SetGet_001');
      const started: number = Date.now();
      const clock: MockClock = new MockClock(1700000000000);
      const jar: CookieJar = new CookieJar();
      TestLogger.step(TAG, 'store and read back one portal cookie');
      const cookie: Cookie = sessionCookie('abc123', clock.now() + SESSION_TTL_MS);
      expect(jar.set(cookie, PORTAL_ORIGIN, clock.now())).assertTrue();
      expect(jar.size()).assertEqual(1);
      const stored: Cookie | null = jar.get(SESSION_COOKIE_NAME, PORTAL_ORIGIN, '/', clock.now());
      expect(stored === null).assertFalse();
      if (stored !== null) {
        expect(stored.value).assertEqual('abc123');
        expect(stored.toHeader()).assertEqual('SESSIONID=abc123');
        expect(stored.secure).assertTrue();
        expect(stored.httpOnly).assertTrue();
      }
      expect(jar.rejectedCount()).assertEqual(0);
      TestLogger.info(TAG, 'session cookie round trip succeeded');
      TestLogger.caseEnd(TAG, 'Auth_Cookie_SetGet_001', Date.now() - started);
    });

    /** A cookie of one domain is invisible to another domain. */
    it('Auth_Cookie_Domain_Isolation_002', 0, async () => {
      TestLogger.caseBegin(TAG, 'Auth_Cookie_Domain_Isolation_002');
      const started: number = Date.now();
      const clock: MockClock = new MockClock(1700000000000);
      const jar: CookieJar = new CookieJar();
      TestLogger.step(TAG, 'probe cross domain isolation');
      jar.set(sessionCookie('portal-secret', clock.now() + SESSION_TTL_MS), PORTAL_ORIGIN,
        clock.now());
      expect(jar.get(SESSION_COOKIE_NAME, TENANT_ORIGIN, '/', clock.now()) === null).assertTrue();
      expect(jar.getAllFor(TENANT_ORIGIN, '/', clock.now()).length).assertEqual(0);
      expect(jar.toRequestHeader(TENANT_ORIGIN, '/', clock.now())).assertEqual('');
      expect(jar.toRequestHeader(PORTAL_ORIGIN, '/', clock.now()))
        .assertEqual('SESSIONID=portal-secret');
      expect(jar.getAllFor(PORTAL_ORIGIN, '/', clock.now()).length).assertEqual(1);
      TestLogger.info(TAG, 'portal cookie never leaks to the tenant origin');
      TestLogger.caseEnd(TAG, 'Auth_Cookie_Domain_Isolation_002', Date.now() - started);
    });

    /** Path scoped cookies only attach below their own prefix. */
    it('Auth_Cookie_Path_Match_003', 0, async () => {
      TestLogger.caseBegin(TAG, 'Auth_Cookie_Path_Match_003');
      const started: number = Date.now();
      const clock: MockClock = new MockClock(1700000000000);
      const jar: CookieJar = new CookieJar();
      TestLogger.step(TAG, 'verify path prefix matching');
      const csrf: Cookie = csrfCookie('csrf-1', clock.now() + SESSION_TTL_MS);
      expect(jar.set(csrf, PORTAL_ORIGIN, clock.now())).assertTrue();
      expect(csrf.matchesPath(PROTECTED_PATH)).assertTrue();
      expect(csrf.matchesPath('/account/settings')).assertTrue();
      expect(csrf.matchesPath('/accounting')).assertFalse();
      expect(csrf.matchesPath('/')).assertFalse();
      expect(jar.get(CSRF_COOKIE_NAME, PORTAL_ORIGIN, '/', clock.now()) === null).assertTrue();
      expect(jar.get(CSRF_COOKIE_NAME, PORTAL_ORIGIN, '/account', clock.now()) === null)
        .assertFalse();
      expect(cookiePairs(jar.toRequestHeader(PORTAL_ORIGIN, '/account', clock.now())).length)
        .assertEqual(1);
      TestLogger.caseEnd(TAG, 'Auth_Cookie_Path_Match_003', Date.now() - started);
    });

    /** A foreign origin cannot plant a cookie for the portal domain. */
    it('Auth_Cookie_CrossDomain_Reject_004', 0, async () => {
      TestLogger.caseBegin(TAG, 'Auth_Cookie_CrossDomain_Reject_004');
      const started: number = Date.now();
      const clock: MockClock = new MockClock(1700000000000);
      const jar: CookieJar = new CookieJar();
      TestLogger.step(TAG, 'reject hostile cross domain writes');
      const hostile: Cookie = hostileCookie('evil', PORTAL_ORIGIN);
      expect(hostile.matchesDomain(PORTAL_ORIGIN)).assertTrue();
      expect(jar.set(hostile, TENANT_ORIGIN, clock.now())).assertFalse();
      expect(jar.size()).assertEqual(0);
      expect(jar.rejectedCount()).assertEqual(1);
      expect(jar.lastRejected()).assertContain(PORTAL_ORIGIN);
      const subDomain: Cookie = hostileCookie('evil', 'sub.example.com');
      expect(jar.set(subDomain, PORTAL_ORIGIN, clock.now())).assertFalse();
      expect(subDomain.matchesDomain('deep.sub.example.com')).assertTrue();
      expect(jar.rejectedCount()).assertEqual(2);
      TestLogger.warn(TAG, 'two cross domain writes were refused');
      TestLogger.caseEnd(TAG, 'Auth_Cookie_CrossDomain_Reject_004', Date.now() - started);
    });

    /** Expired cookies are neither returned nor kept after a purge. */
    it('Auth_Cookie_Expire_Purge_005', 0, async () => {
      TestLogger.caseBegin(TAG, 'Auth_Cookie_Expire_Purge_005');
      const started: number = Date.now();
      const clock: MockClock = new MockClock(1700000000000);
      const jar: CookieJar = new CookieJar();
      TestLogger.step(TAG, 'let a short lived cookie expire');
      const issueAt: number = clock.now();
      jar.set(sessionCookie('short', issueAt + 1000), PORTAL_ORIGIN, issueAt);
      expect(jar.get(SESSION_COOKIE_NAME, PORTAL_ORIGIN, '/', issueAt) === null).assertFalse();
      clock.advance(999);
      expect(jar.get(SESSION_COOKIE_NAME, PORTAL_ORIGIN, '/', clock.now()) === null).assertFalse();
      clock.advance(1);
      expect(jar.get(SESSION_COOKIE_NAME, PORTAL_ORIGIN, '/', clock.now()) === null).assertTrue();
      expect(jar.toRequestHeader(PORTAL_ORIGIN, '/', clock.now())).assertEqual('');
      expect(jar.purgeExpired(clock.now())).assertEqual(1);
      expect(jar.size()).assertEqual(0);
      expect(jar.purgeExpired(clock.now())).assertEqual(0);
      TestLogger.caseEnd(TAG, 'Auth_Cookie_Expire_Purge_005', Date.now() - started);
    });

    /** Session cookies stay until the tab is closed. */
    it('Auth_Cookie_Session_Lifetime_006', 0, async () => {
      TestLogger.caseBegin(TAG, 'Auth_Cookie_Session_Lifetime_006');
      const started: number = Date.now();
      const clock: MockClock = new MockClock(1700000000000);
      const jar: CookieJar = new CookieJar();
      TestLogger.step(TAG, 'keep a session cookie alive across a long gap');
      const cookie: Cookie = sessionCookie('alive', 0);
      expect(cookie.isSessionCookie()).assertTrue();
      expect(cookie.isExpired(clock.now())).assertFalse();
      jar.set(cookie, PORTAL_ORIGIN, clock.now());
      clock.advance(86400000);
      expect(jar.get(SESSION_COOKIE_NAME, PORTAL_ORIGIN, '/', clock.now()) === null).assertFalse();
      expect(jar.purgeExpired(clock.now())).assertEqual(0);
      expect(cookiePairCount(jar)).assertEqual(1);
      TestLogger.caseEnd(TAG, 'Auth_Cookie_Session_Lifetime_006', Date.now() - started);
    });

    /** Writing the same name again replaces rather than duplicates. */
    it('Auth_Cookie_Overwrite_007', 0, async () => {
      TestLogger.caseBegin(TAG, 'Auth_Cookie_Overwrite_007');
      const started: number = Date.now();
      const clock: MockClock = new MockClock(1700000000000);
      const jar: CookieJar = new CookieJar();
      TestLogger.step(TAG, 'overwrite an existing session cookie');
      jar.set(sessionCookie('first', clock.now() + SESSION_TTL_MS), PORTAL_ORIGIN, clock.now());
      jar.set(sessionCookie('second', clock.now() + SESSION_TTL_MS), PORTAL_ORIGIN, clock.now());
      expect(jar.size()).assertEqual(1);
      expect(jar.names().length).assertEqual(1);
      const stored: Cookie | null = jar.get(SESSION_COOKIE_NAME, PORTAL_ORIGIN, '/', clock.now());
      expect(stored === null).assertFalse();
      if (stored !== null) {
        expect(stored.value).assertEqual('second');
      }
      expect(jar.toRequestHeader(PORTAL_ORIGIN, '/', clock.now())).assertEqual('SESSIONID=second');
      TestLogger.caseEnd(TAG, 'Auth_Cookie_Overwrite_007', Date.now() - started);
    });

    /** Secure cookies are counted and flagged for https only delivery. */
    it('Auth_Cookie_Secure_Flag_008', 0, async () => {
      TestLogger.caseBegin(TAG, 'Auth_Cookie_Secure_Flag_008');
      const started: number = Date.now();
      const clock: MockClock = new MockClock(1700000000000);
      const jar: CookieJar = new CookieJar();
      TestLogger.step(TAG, 'check secure and httpOnly flags');
      jar.set(sessionCookie('secure-value', clock.now() + SESSION_TTL_MS), PORTAL_ORIGIN,
        clock.now());
      jar.set(csrfCookie('csrf-value', clock.now() + SESSION_TTL_MS), PORTAL_ORIGIN, clock.now());
      jar.set(refreshCookie('refresh-value', clock.now() + SESSION_TTL_MS), LOGIN_ORIGIN,
        clock.now());
      expect(jar.size()).assertEqual(3);
      expect(jar.secureCount()).assertEqual(3);
      expect(jar.httpOnlyCount()).assertEqual(2);
      const stored: Cookie | null = jar.get(SESSION_COOKIE_NAME, PORTAL_ORIGIN, '/', clock.now());
      if (stored !== null) {
        expect(stored.attributes()).assertContain('Secure');
        expect(stored.attributes()).assertContain('HttpOnly');
        expect(stored.attributes()).assertContain('SameSite=Lax');
      }
      TestLogger.caseEnd(TAG, 'Auth_Cookie_Secure_Flag_008', Date.now() - started);
    });

    /** The session cookie expires together with the login session. */
    it('Auth_Cookie_Aligns_Session_009', 0, async () => {
      TestLogger.caseBegin(TAG, 'Auth_Cookie_Aligns_Session_009');
      const started: number = Date.now();
      const clock: MockClock = new MockClock(1700000000000);
      const session: TabSession = new TabSession(0);
      TestLogger.step(TAG, 'log in and align the cookie with the token');
      const token: AuthToken = tokenForTab(0, clock.now());
      expect(session.login(token)).assertTrue();
      expect(session.isLoggedIn(clock.now())).assertTrue();
      expect(session.cookieCount()).assertEqual(1);
      expect(session.canReachProtected(clock.now())).assertTrue();
      clock.advance(SESSION_TTL_MS);
      expect(session.isLoggedIn(clock.now())).assertFalse();
      expect(session.canReachProtected(clock.now())).assertFalse();
      expect(session.cookieCount()).assertEqual(1);
      TestLogger.caseEnd(TAG, 'Auth_Cookie_Aligns_Session_009', Date.now() - started);
    });

    /** A live token produces one well formed Authorization header. */
    it('Auth_Bearer_Header_010', 0, async () => {
      TestLogger.caseBegin(TAG, 'Auth_Bearer_Header_010');
      const started: number = Date.now();
      const clock: MockClock = new MockClock(1700000000000);
      const injector: BearerInjector = new BearerInjector();
      const token: AuthToken = AuthToken.fixture(clock.now());
      TestLogger.step(TAG, 'build the authorization header');
      const header: string = injector.inject(token, clock.now());
      expect(header).assertContain(AUTH_HEADER);
      expect(header).assertContain(BEARER_SCHEME);
      expect(isAuthorizationLine(header)).assertTrue();
      expect(header).assertContain(token.value);
      expect(injector.headerCount()).assertEqual(1);
      expect(injector.lastHeader()).assertEqual(header);
      expect(injector.rejectedCount()).assertEqual(0);
      expect(token.hasScope('browser.read')).assertTrue();
      expect(token.hasScope('admin.write')).assertFalse();
      TestLogger.caseEnd(TAG, 'Auth_Bearer_Header_010', Date.now() - started);
    });

    /** An expired token must not be injected at all. */
    it('Auth_Bearer_Missing_Or_Expired_011', 0, async () => {
      TestLogger.caseBegin(TAG, 'Auth_Bearer_Missing_Or_Expired_011');
      const started: number = Date.now();
      const clock: MockClock = new MockClock(1700000000000);
      const injector: BearerInjector = new BearerInjector();
      const token: AuthToken = AuthToken.fixture(clock.now());
      TestLogger.step(TAG, 'inject an expired token');
      clock.advance(SESSION_TTL_MS);
      expect(token.isExpired(clock.now())).assertTrue();
      expect(token.isValid(clock.now())).assertFalse();
      expect(injector.inject(token, clock.now())).assertEqual('');
      expect(injector.headerCount()).assertEqual(0);
      expect(injector.rejectedCount()).assertEqual(1);
      const headers: string[] = injector.requestHeaders(token, clock.now(), ['Accept: */*']);
      expect(headers.length).assertEqual(1);
      expect(headers[0]).assertEqual('Accept: */*');
      TestLogger.warn(TAG, 'expired token never reached the request headers');
      TestLogger.caseEnd(TAG, 'Auth_Bearer_Missing_Or_Expired_011', Date.now() - started);
    });

    /** Extra caller headers keep their order behind the auth header. */
    it('Auth_Bearer_Header_Order_012', 0, async () => {
      TestLogger.caseBegin(TAG, 'Auth_Bearer_Header_Order_012');
      const started: number = Date.now();
      const clock: MockClock = new MockClock(1700000000000);
      const injector: BearerInjector = new BearerInjector();
      const token: AuthToken = fixtureToken(clock.now());
      TestLogger.step(TAG, 'assemble a full request header list');
      const extra: string[] = ['Accept: text/html', 'Accept-Language: zh-CN', 'Cache-Control: no-cache'];
      const headers: string[] = injector.requestHeaders(token, clock.now(), extra);
      expect(headers.length).assertEqual(4);
      expect(isAuthorizationLine(headers[0])).assertTrue();
      expect(headers[1]).assertEqual('Accept: text/html');
      expect(headers[3]).assertEqual('Cache-Control: no-cache');
      expect(injector.headerCount()).assertEqual(1);
      TestLogger.caseEnd(TAG, 'Auth_Bearer_Header_Order_012', Date.now() - started);
    });

    /** Signing in on one tab must not sign in another tab. */
    it('Auth_Tab_Isolation_013', 0, async () => {
      TestLogger.caseBegin(TAG, 'Auth_Tab_Isolation_013');
      const started: number = Date.now();
      const clock: MockClock = new MockClock(1700000000000);
      const registry: SessionRegistry = new SessionRegistry(3);
      TestLogger.step(TAG, 'log in on the first tab only');
      expect(registry.size()).assertEqual(3);
      expect(registry.loginAt(0, tokenForTab(0, clock.now()))).assertTrue();
      expect(registry.loggedInCount(clock.now())).assertEqual(1);
      expect(registry.tabsWithCookies()).assertEqual(1);
      expect(registry.totalCookies()).assertEqual(1);
      const second: TabSession | null = registry.sessionAt(1);
      expect(second === null).assertFalse();
      if (second !== null) {
        expect(second.isLoggedIn(clock.now())).assertFalse();
        expect(second.cookieCount()).assertEqual(0);
        expect(second.token === null).assertTrue();
      }
      expect(registry.isIsolated()).assertTrue();
      TestLogger.info(TAG, 'session of tab 0 stayed inside tab 0');
      TestLogger.caseEnd(TAG, 'Auth_Tab_Isolation_013', Date.now() - started);
    });

    /** Two tabs authenticated with different tokens keep both jars. */
    it('Auth_Tab_Distinct_Tokens_014', 0, async () => {
      TestLogger.caseBegin(TAG, 'Auth_Tab_Distinct_Tokens_014');
      const started: number = Date.now();
      const clock: MockClock = new MockClock(1700000000000);
      const registry: SessionRegistry = new SessionRegistry(2);
      TestLogger.step(TAG, 'log in with a distinct token per tab');
      registry.loginAt(0, tokenForTab(0, clock.now()));
      registry.loginAt(1, tokenForTab(1, clock.now()));
      const first: TabSession | null = registry.sessionAt(0);
      const second: TabSession | null = registry.sessionAt(1);
      expect(first === null).assertFalse();
      expect(second === null).assertFalse();
      if (first !== null && second !== null) {
        expect(first.tokenValue()).assertContain('tab-0');
        expect(second.tokenValue()).assertContain('tab-1');
        expect(first.tokenValue() === second.tokenValue()).assertFalse();
        expect(first.jar.size()).assertEqual(1);
        expect(second.jar.size()).assertEqual(1);
        expect(first.jar.cookies[0].value).assertEqual('toke***');
      }
      expect(registry.loggedInCount(clock.now())).assertEqual(2);
      expect(registry.isIsolated()).assertTrue();
      TestLogger.caseEnd(TAG, 'Auth_Tab_Distinct_Tokens_014', Date.now() - started);
    });

    /** Long idle time expires the token but the tab stays open. */
    it('Auth_Session_Expiry_015', 0, async () => {
      TestLogger.caseBegin(TAG, 'Auth_Session_Expiry_015');
      const started: number = Date.now();
      const clock: MockClock = new MockClock(1700000000000);
      const session: TabSession = new TabSession(0);
      const token: AuthToken = fixtureToken(clock.now());
      TestLogger.step(TAG, 'advance the clock past the session ttl');
      session.login(token);
      expect(session.isLoggedIn(clock.now())).assertTrue();
      expect(token.remaining(clock.now())).assertEqual(SESSION_TTL_MS);
      clock.advance(SESSION_TTL_MS - 1);
      expect(session.isLoggedIn(clock.now())).assertTrue();
      expect(token.remaining(clock.now())).assertEqual(1);
      clock.advance(1);
      expect(session.isLoggedIn(clock.now())).assertFalse();
      expect(token.remaining(clock.now())).assertEqual(0);
      expect(session.canReachProtected(clock.now())).assertFalse();
      expect(session.cookieCount()).assertEqual(1);
      expect(token.masked()).assertEqual('eyJh***');
      TestLogger.caseEnd(TAG, 'Auth_Session_Expiry_015', Date.now() - started);
    });

    /** A token inside the refresh window is renewed seamlessly. */
    it('Auth_Session_Renew_016', 0, async () => {
      TestLogger.caseBegin(TAG, 'Auth_Session_Renew_016');
      const started: number = Date.now();
      const clock: MockClock = new MockClock(1700000000000);
      const session: TabSession = new TabSession(0);
      const token: AuthToken = fixtureToken(clock.now());
      TestLogger.step(TAG, 'enter the renewal window');
      session.login(token);
      expect(token.shouldRenew(clock.now())).assertFalse();
      clock.advance(SESSION_TTL_MS - RENEW_WINDOW_MS);
      expect(token.shouldRenew(clock.now())).assertTrue();
      const renewed: AuthToken = token.renew(clock.now());
      expect(renewed.value).assertEqual(token.value);
      expect(renewed.expiresAt).assertLarger(token.expiresAt);
      expect(renewed.remaining(clock.now())).assertEqual(RENEWED_TTL_MS);
      expect(renewed.isValid(clock.now())).assertTrue();
      expect(session.login(renewed)).assertTrue();
      expect(session.isLoggedIn(clock.now())).assertTrue();
      expect(session.logoutCount).assertEqual(0);
      TestLogger.info(TAG, 'session renewed without a logout');
      TestLogger.caseEnd(TAG, 'Auth_Session_Renew_016', Date.now() - started);
    });

    /** Renewal keeps the scope set of the original token. */
    it('Auth_Session_Renew_Scopes_017', 0, async () => {
      TestLogger.caseBegin(TAG, 'Auth_Session_Renew_Scopes_017');
      const started: number = Date.now();
      const clock: MockClock = new MockClock(1700000000000);
      const token: AuthToken = fixtureToken(clock.now());
      TestLogger.step(TAG, 'renew and compare the scope sets');
      const renewed: AuthToken = token.renew(clock.now());
      expect(renewed.scopes.length).assertEqual(token.scopes.length);
      expect(renewed.hasScope('browser.read')).assertTrue();
      expect(renewed.hasScope('browser.history')).assertTrue();
      expect(renewed.hasScope('account.read')).assertTrue();
      expect(renewed.issuedAt).assertEqual(clock.now());
      const escalated: AuthToken = token.withScope('account.write');
      expect(escalated.scopes.length).assertEqual(token.scopes.length + 1);
      expect(escalated.hasScope('account.write')).assertTrue();
      expect(token.hasScope('account.write')).assertFalse();
      TestLogger.caseEnd(TAG, 'Auth_Session_Renew_Scopes_017', Date.now() - started);
    });

    /** Logout clears the token and every cookie of that tab only. */
    it('Auth_Logout_Cleanup_018', 0, async () => {
      TestLogger.caseBegin(TAG, 'Auth_Logout_Cleanup_018');
      const started: number = Date.now();
      const clock: MockClock = new MockClock(1700000000000);
      const registry: SessionRegistry = new SessionRegistry(2);
      TestLogger.step(TAG, 'sign out of one tab');
      registry.loginAt(0, tokenForTab(0, clock.now()));
      registry.loginAt(1, tokenForTab(1, clock.now()));
      expect(registry.totalCookies()).assertEqual(2);
      const removed: number = registry.logoutAt(0);
      expect(removed).assertEqual(1);
      const first: TabSession | null = registry.sessionAt(0);
      const second: TabSession | null = registry.sessionAt(1);
      if (first !== null) {
        expect(first.token === null).assertTrue();
        expect(first.cookieCount()).assertEqual(0);
        expect(first.logoutCount).assertEqual(1);
      }
      if (second !== null) {
        expect(second.isLoggedIn(clock.now())).assertTrue();
        expect(second.cookieCount()).assertEqual(1);
      }
      expect(registry.loggedInCount(clock.now())).assertEqual(1);
      TestLogger.caseEnd(TAG, 'Auth_Logout_Cleanup_018', Date.now() - started);
    });

    /** Signing out everywhere clears every jar in one shot. */
    it('Auth_Logout_All_Tabs_019', 0, async () => {
      TestLogger.caseBegin(TAG, 'Auth_Logout_All_Tabs_019');
      const started: number = Date.now();
      const clock: MockClock = new MockClock(1700000000000);
      const browser: MockBrowser = new MockBrowser(3);
      const registry: SessionRegistry = new SessionRegistry(browser.getTabKeys().length);
      TestLogger.step(TAG, 'sign out of every tab');
      for (let index = 0; index < registry.size(); index++) {
        registry.loginAt(index, tokenForTab(index, clock.now()));
      }
      expect(registry.loggedInCount(clock.now())).assertEqual(3);
      expect(registry.totalCookies()).assertEqual(3);
      const signedOut: number = registry.logoutAll();
      expect(signedOut).assertEqual(3);
      expect(registry.loggedInCount(clock.now())).assertEqual(0);
      expect(registry.totalCookies()).assertEqual(0);
      expect(registry.tabsWithCookies()).assertEqual(0);
      expect(registry.isIsolated()).assertTrue();
      expect(browser.getTabKeys().length).assertEqual(3);
      TestLogger.info(TAG, 'all three tab sessions invalidated');
      TestLogger.caseEnd(TAG, 'Auth_Logout_All_Tabs_019', Date.now() - started);
    });

    /** No secret may ever reach the log sink. */
    it('Auth_Sensitive_Header_Redaction_020', 0, async () => {
      TestLogger.caseBegin(TAG, 'Auth_Sensitive_Header_Redaction_020');
      const started: number = Date.now();
      const clock: MockClock = new MockClock(1700000000000);
      const injector: BearerInjector = new BearerInjector();
      const guard: SensitiveLogGuard = new SensitiveLogGuard();
      const token: AuthToken = fixtureToken(clock.now());
      TestLogger.step(TAG, 'redact an authorization header before logging');
      const header: string = injector.inject(token, clock.now());
      const safe: string = guard.record(header);
      expect(safe).assertContain(REDACTED);
      expect(safe.indexOf(token.value)).assertEqual(-1);
      expect(guard.contains(token.value)).assertFalse();
      expect(guard.contains('eyJhbGciOiJIUzI1NiJ9')).assertFalse();
      const cookieLine: string = `${COOKIE_HEADER}: SESSIONID=${token.value}`;
      const safeCookie: string = guard.record(cookieLine);
      expect(safeCookie).assertContain(REDACTED);
      expect(guard.contains(token.value)).assertFalse();
      expect(guard.lineCount()).assertEqual(2);
      TestLogger.info(TAG, guard.lastLine());
      TestLogger.caseEnd(TAG, 'Auth_Sensitive_Header_Redaction_020', Date.now() - started);
    });

    /** The serialized Cookie header keeps a stable name=value format. */
    it('Auth_Cookie_Header_Format_021', 0, async () => {
      TestLogger.caseBegin(TAG, 'Auth_Cookie_Header_Format_021');
      const started: number = Date.now();
      const clock: MockClock = new MockClock(1700000000000);
      const jar: CookieJar = new CookieJar();
      TestLogger.step(TAG, 'serialize multiple cookies into one header');
      jar.set(sessionCookie('sid-1', clock.now() + SESSION_TTL_MS), PORTAL_ORIGIN, clock.now());
      jar.set(new Cookie('theme', 'dark', PORTAL_ORIGIN, '/', false, false,
        clock.now() + SESSION_TTL_MS, 'Lax'), PORTAL_ORIGIN, clock.now());
      const header: string = jar.toRequestHeader(PORTAL_ORIGIN, '/', clock.now());
      expect(cookiePairs(header).length).assertEqual(2);
      expect(pairValue(header, SESSION_COOKIE_NAME)).assertEqual('sid-1');
      expect(pairValue(header, 'theme')).assertEqual('dark');
      expect(header).assertContain('; ');
      expect(header.indexOf('Set-Cookie')).assertEqual(-1);
      expect(header.indexOf('Secure')).assertEqual(-1);
      TestLogger.info(TAG, `cookie header length ${header.length}`);
      TestLogger.caseEnd(TAG, 'Auth_Cookie_Header_Format_021', Date.now() - started);
    });

    /** A cookie replayed against the wrong host is refused. */
    it('Auth_Session_Replay_Rejected_022', 0, async () => {
      TestLogger.caseBegin(TAG, 'Auth_Session_Replay_Rejected_022');
      const started: number = Date.now();
      const clock: MockClock = new MockClock(1700000000000);
      const jar: CookieJar = new CookieJar();
      TestLogger.step(TAG, 'replay a portal cookie against a foreign host');
      const cookie: Cookie = sessionCookie('replay-me', clock.now() + SESSION_TTL_MS);
      jar.set(cookie, PORTAL_ORIGIN, clock.now());
      expect(jar.toRequestHeader(TENANT_ORIGIN, '/', clock.now())).assertEqual('');
      expect(cookie.isCrossDomain(TENANT_ORIGIN)).assertTrue();
      expect(cookie.isCrossDomain(PORTAL_ORIGIN)).assertFalse();
      const replayed: boolean = jar.set(cookie, TENANT_ORIGIN, clock.now());
      expect(replayed).assertFalse();
      expect(jar.rejectedCount()).assertEqual(1);
      expect(jar.size()).assertEqual(1);
      expect(jar.names()[0]).assertEqual(SESSION_COOKIE_NAME);
      TestLogger.warn(TAG, 'replay attempt logged and ignored');
      TestLogger.caseEnd(TAG, 'Auth_Session_Replay_Rejected_022', Date.now() - started);
    });

    /** Logging out of the login origin drops the refresh cookie only. */
    it('Auth_Logout_Domain_Scoped_023', 0, async () => {
      TestLogger.caseBegin(TAG, 'Auth_Logout_Domain_Scoped_023');
      const started: number = Date.now();
      const clock: MockClock = new MockClock(1700000000000);
      const jar: CookieJar = new CookieJar();
      TestLogger.step(TAG, 'drop the login origin cookies');
      jar.set(refreshCookie('refresh-1', clock.now() + SESSION_TTL_MS), LOGIN_ORIGIN, clock.now());
      jar.set(sessionCookie('sid-2', clock.now() + SESSION_TTL_MS), PORTAL_ORIGIN, clock.now());
      expect(jar.size()).assertEqual(2);
      const removed: number = jar.removeDomain(LOGIN_ORIGIN);
      expect(removed).assertEqual(1);
      expect(jar.size()).assertEqual(1);
      expect(jar.names()[0]).assertEqual(SESSION_COOKIE_NAME);
      expect(jar.get(REFRESH_COOKIE_NAME, LOGIN_ORIGIN, '/', clock.now()) === null).assertTrue();
      expect(jar.get(SESSION_COOKIE_NAME, PORTAL_ORIGIN, '/', clock.now()) === null).assertFalse();
      expect(jar.removeDomain(LOGIN_ORIGIN)).assertEqual(0);
      TestLogger.caseEnd(TAG, 'Auth_Logout_Domain_Scoped_023', Date.now() - started);
    });

    /** A refresh attempt while offline must keep the current session. */
    it('Auth_Session_Renew_Offline_024', 0, async () => {
      TestLogger.caseBegin(TAG, 'Auth_Session_Renew_Offline_024');
      const started: number = Date.now();
      const clock: MockClock = new MockClock(1700000000000);
      const network: MockNetwork = new MockNetwork();
      const session: TabSession = new TabSession(0);
      const token: AuthToken = fixtureToken(clock.now());
      TestLogger.step(TAG, 'attempt a renewal with the network down');
      session.login(token);
      clock.advance(SESSION_TTL_MS - RENEW_WINDOW_MS);
      expect(token.shouldRenew(clock.now())).assertTrue();
      network.setOnline(false);
      const renewed: boolean = network.fetch(`${LOGIN_ORIGIN}/oauth/refresh`);
      expect(renewed).assertFalse();
      expect(network.requestCount()).assertEqual(1);
      expect(session.isLoggedIn(clock.now())).assertTrue();
      network.setOnline(true);
      expect(network.fetch(`${LOGIN_ORIGIN}/oauth/refresh`)).assertTrue();
      expect(network.requestCount()).assertEqual(2);
      expect(session.login(token.renew(clock.now()))).assertTrue();
      expect(session.isLoggedIn(clock.now())).assertTrue();
      TestLogger.info(TAG, 'renewal deferred until the network returned');
      TestLogger.caseEnd(TAG, 'Auth_Session_Renew_Offline_024', Date.now() - started);
    });

    /** The address bar stays usable after a logout. */
    it('Auth_Logout_Keeps_Ui_025', 0, async () => {
      TestLogger.caseBegin(TAG, 'Auth_Logout_Keeps_Ui_025');
      const started: number = Date.now();
      const clock: MockClock = new MockClock(1700000000000);
      const registry: SessionRegistry = new SessionRegistry(1);
      TestLogger.step(TAG, 'logout and verify the browser ui survives');
      registry.loginAt(0, fixtureToken(clock.now()));
      const session: TabSession | null = registry.sessionAt(0);
      if (session !== null) {
        expect(session.canReachProtected(clock.now())).assertTrue();
        session.logout();
        expect(session.canReachProtected(clock.now())).assertFalse();
      }
      expect(registry.loggedInCount(clock.now())).assertEqual(0);
      expect(await componentByIdExists(driver, ID_INPUT_URL)).assertTrue();
      expect(await countById(driver, ID_ACTION_SUBMIT)).assertLarger(0);
      TestLogger.info(TAG, 'browser chrome still reachable after logout');
      TestLogger.caseEnd(TAG, 'Auth_Logout_Keeps_Ui_025', Date.now() - started);
    });

    /** Consolidated auth report of the last run. */
    it('Auth_Session_Report_026', 0, async () => {
      TestLogger.caseBegin(TAG, 'Auth_Session_Report_026');
      const started: number = Date.now();
      const clock: MockClock = new MockClock(1700000000000);
      const registry: SessionRegistry = new SessionRegistry(2);
      const injector: BearerInjector = new BearerInjector();
      const guard: SensitiveLogGuard = new SensitiveLogGuard();
      TestLogger.step(TAG, 'assemble the auth report');
      registry.loginAt(0, tokenForTab(0, clock.now()));
      registry.loginAt(1, tokenForTab(1, clock.now()));
      const line1: string = injector.inject(fixtureToken(clock.now()), clock.now());
      const line2: string = `${COOKIE_HEADER}: SESSIONID=abc`;
      guard.recordHeaders([line1, line2]);
      const report: string[] = [];
      report.push(`tabs=${registry.size()}`);
      report.push(`loggedIn=${registry.loggedInCount(clock.now())}`);
      report.push(`cookies=${registry.totalCookies()}`);
      report.push(`headers=${injector.headerCount()}`);
      report.push(`safeLines=${guard.lineCount()}`);
      expect(report.length).assertEqual(5);
      expect(report[0]).assertEqual('tabs=2');
      expect(report[1]).assertEqual('loggedIn=2');
      expect(report[2]).assertEqual('cookies=2');
      expect(report[3]).assertEqual('headers=1');
      expect(report[4]).assertEqual('safeLines=2');
      for (let index = 0; index < report.length; index++) {
        TestLogger.info(TAG, report[index]);
      }
      expect(guard.contains('abc')).assertFalse();
      expect(await waitForId(driver, ID_INPUT_URL, TIMEOUT_COMPONENT)).assertTrue();
      TestLogger.caseEnd(TAG, 'Auth_Session_Report_026', Date.now() - started);
    });
  });
}
