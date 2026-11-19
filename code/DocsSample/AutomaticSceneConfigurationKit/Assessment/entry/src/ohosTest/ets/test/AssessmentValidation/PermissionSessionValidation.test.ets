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

import { afterAll, beforeAll, describe, expect, it } from '@ohos/hypium';
import { Component, Driver } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  ID_INDEX_TITLE,
  ID_END_BUTTON,
  ID_QUERY_STATE_BUTTON,
  ID_QUERY_CONFIG_BUTTON,
  TEXT_STATE_INACTIVE,
  TEXT_NO_ACTIVE_ASSESSMENT,
  TIMEOUT_PAGE_RENDER,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  checkTextContent,
  waitForIndexPage,
  isComponentEnabled,
  clickIndexButton,
  pressAndWait,
  KEY_BACK,
  DELAY_KEY_NAVIGATION
} from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// Capability that gates the assessment APIs of the sample.
const SYSCAP_ASSESSMENT: string = 'SystemCapability.Customization.AssessmentConfiguration';

// Permissions of the sample. The first one is the primary permission of the assessment
// service, the second one is requested in addition because the sample turns on the privacy
// mode of the exam window.
const PERMISSION_ASSESSMENT: string = 'ohos.permission.ASSESSMENT_CONFIGURATION';
const PERMISSION_PRIVACY_WINDOW: string = 'ohos.permission.PRIVACY_WINDOW';

// Grant metadata declared by the sample module. A system granted permission of the
// system_basic level is granted at install time and cannot be revoked by the user.
const GRANT_MODE_SYSTEM: string = 'system_grant';
const LEVEL_SYSTEM_BASIC: string = 'system_basic';

// Business error codes that the guards of the sample translate into user facing messages.
const CODE_PERMISSION_DENIED: number = 201;
const CODE_CAPABILITY_NOT_SUPPORT: number = 801;
const CODE_UNKNOWN: number = 0;

// Session identifiers used by the model cases. The owner token is the bundle name of the
// caller, which is what the assessment service uses to bind a session to an application.
const OWNER_SAMPLE: string = 'com.samples.assessment';
const OWNER_SAMPLE_ENTRY: string = 'com.samples.assessment:entry';
const OWNER_FOREIGN: string = 'com.samples.dictionary';
const SESSION_PRIMARY: string = 'assessment-session-1';
const SESSION_SECONDARY: string = 'assessment-session-2';

/**
 * One permission that the sample requests from the system.
 */
interface PermissionDescriptor {
  name: string;
  grantMode: string;
  availableLevel: string;
  secondary: boolean;
  reason: string;
}

/**
 * Outcome of a permission and capability evaluation.
 */
enum GuardOutcome {
  GRANTED = 0,
  DENIED = 1,
  UNSUPPORTED = 2
}

/**
 * Catalog of the permissions that the sample declares.
 *
 * The catalog reproduces module.json5 of the sample, a descriptor that drifts from the module
 * file shows up as a failed assertion instead of an installation failure.
 */
class PermissionCatalog {
  private descriptors: PermissionDescriptor[] = [];

  constructor() {
    this.descriptors = [
      {
        name: PERMISSION_ASSESSMENT,
        grantMode: GRANT_MODE_SYSTEM,
        availableLevel: LEVEL_SYSTEM_BASIC,
        secondary: false,
        reason: 'enter and leave assessment mode'
      },
      {
        name: PERMISSION_PRIVACY_WINDOW,
        grantMode: GRANT_MODE_SYSTEM,
        availableLevel: LEVEL_SYSTEM_BASIC,
        secondary: true,
        reason: 'enable the privacy mode of the exam window'
      }
    ];
  }

  public size(): number {
    return this.descriptors.length;
  }

  public all(): PermissionDescriptor[] {
    return this.descriptors.slice();
  }

  public names(): string[] {
    const values: string[] = [];
    for (let i = 0; i < this.descriptors.length; i++) {
      values.push(this.descriptors[i].name);
    }
    return values;
  }

  public find(name: string): PermissionDescriptor | undefined {
    for (let i = 0; i < this.descriptors.length; i++) {
      if (this.descriptors[i].name === name) {
        return this.descriptors[i];
      }
    }
    return undefined;
  }

  public primary(): PermissionDescriptor {
    return this.descriptors[0];
  }

  public secondary(): PermissionDescriptor[] {
    const values: PermissionDescriptor[] = [];
    for (let i = 0; i < this.descriptors.length; i++) {
      if (this.descriptors[i].secondary) {
        values.push(this.descriptors[i]);
      }
    }
    return values;
  }

  public systemGrantedCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.descriptors.length; i++) {
      if (this.descriptors[i].grantMode === GRANT_MODE_SYSTEM) {
        count++;
      }
    }
    return count;
  }

  public systemBasicCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.descriptors.length; i++) {
      if (this.descriptors[i].availableLevel === LEVEL_SYSTEM_BASIC) {
        count++;
      }
    }
    return count;
  }

  public hasDuplicateNames(): boolean {
    const seen: Set<string> = new Set<string>();
    for (let i = 0; i < this.descriptors.length; i++) {
      if (seen.has(this.descriptors[i].name)) {
        return true;
      }
      seen.add(this.descriptors[i].name);
    }
    return false;
  }

  /**
   * Validates every permission descriptor of the catalog.
   *
   * @returns the validation issues, an empty array when the catalog is consistent.
   */
  public validate(): string[] {
    const issues: string[] = [];
    if (this.descriptors.length === 0) {
      issues.push('the permission catalog is empty');
      return issues;
    }
    if (this.hasDuplicateNames()) {
      issues.push('a permission is declared twice');
    }
    for (let i = 0; i < this.descriptors.length; i++) {
      const descriptor: PermissionDescriptor = this.descriptors[i];
      if (descriptor.name.indexOf('ohos.permission.') !== 0) {
        issues.push(`permission ${descriptor.name} is not a system permission`);
      }
      if (descriptor.grantMode !== GRANT_MODE_SYSTEM) {
        issues.push(`permission ${descriptor.name} is not system granted`);
      }
      if (descriptor.availableLevel !== LEVEL_SYSTEM_BASIC) {
        issues.push(`permission ${descriptor.name} is not system_basic`);
      }
      if (descriptor.reason.length === 0) {
        issues.push(`permission ${descriptor.name} has no reason`);
      }
    }
    return issues;
  }
}

/**
 * Maps a permission and capability state onto the documented error codes.
 *
 * The order is fixed: a missing capability is reported first because the namespace itself is
 * absent, the permission check only makes sense when the namespace exists.
 */
class PermissionGuard {
  private hasPermission: boolean;
  private hasCapability: boolean;

  constructor(hasPermission: boolean, hasCapability: boolean) {
    this.hasPermission = hasPermission;
    this.hasCapability = hasCapability;
  }

  public evaluate(): GuardOutcome {
    if (!this.hasCapability) {
      return GuardOutcome.UNSUPPORTED;
    }
    if (!this.hasPermission) {
      return GuardOutcome.DENIED;
    }
    return GuardOutcome.GRANTED;
  }

  public errorCode(): number {
    const outcome: GuardOutcome = this.evaluate();
    if (outcome === GuardOutcome.DENIED) {
      return CODE_PERMISSION_DENIED;
    }
    if (outcome === GuardOutcome.UNSUPPORTED) {
      return CODE_CAPABILITY_NOT_SUPPORT;
    }
    return CODE_UNKNOWN;
  }

  public isCallable(): boolean {
    return this.evaluate() === GuardOutcome.GRANTED;
  }

  public describe(): string {
    const outcome: GuardOutcome = this.evaluate();
    if (outcome === GuardOutcome.GRANTED) {
      return 'the assessment APIs are callable';
    }
    if (outcome === GuardOutcome.DENIED) {
      return `${CODE_PERMISSION_DENIED}: ${PERMISSION_ASSESSMENT} is not granted`;
    }
    return `${CODE_CAPABILITY_NOT_SUPPORT}: ${SYSCAP_ASSESSMENT} is not supported`;
  }
}

/**
 * Checks whether an error code is one of the documented guard results of the sample.
 *
 * @param code business error code reported by the API.
 * @returns true for 201 and 801, false for any other code.
 */
function isDocumentedGuardCode(code: number): boolean {
  return code === CODE_PERMISSION_DENIED || code === CODE_CAPABILITY_NOT_SUPPORT;
}

/**
 * Normalizes an owner token of a session.
 *
 * A UIAbility that is started in a process of its own reports its token with a suffix, the
 * service binds the session to the bundle name and ignores the suffix. The helper keeps the
 * comparison of the sample models aligned with that rule.
 *
 * @param token owner token, for example com.samples.assessment:entry.
 * @returns the bundle name part of the token.
 */
function normalizeOwner(token: string): string {
  const separator: number = token.indexOf(':');
  if (separator <= 0) {
    return token;
  }
  return token.substring(0, separator);
}

/**
 * One assessment session as it is bound by the assessment service.
 */
class SessionBinding {
  private owner: string;
  private sessionId: string;
  private beginSeq: number;
  private active: boolean;
  private endAttempts: number = 0;
  private acceptedEnds: number = 0;

  constructor(owner: string, sessionId: string, beginSeq: number) {
    this.owner = owner;
    this.sessionId = sessionId;
    this.beginSeq = beginSeq;
    this.active = true;
  }

  public getOwner(): string {
    return this.owner;
  }

  public getSessionId(): string {
    return this.sessionId;
  }

  public getBeginSeq(): number {
    return this.beginSeq;
  }

  public isActive(): boolean {
    return this.active;
  }

  public getEndAttempts(): number {
    return this.endAttempts;
  }

  public getAcceptedEnds(): number {
    return this.acceptedEnds;
  }

  /**
   * Checks whether a requester is allowed to end this session.
   *
   * @param requester owner token of the caller.
   * @returns true only when the caller started the session.
   */
  public isOwner(requester: string): boolean {
    return normalizeOwner(requester) === normalizeOwner(this.owner);
  }

  /**
   * Attempts to end the session on behalf of a requester.
   *
   * @param requester owner token of the caller.
   * @returns true when the session was ended by this call.
   */
  public end(requester: string): boolean {
    this.endAttempts++;
    if (!this.active) {
      return false;
    }
    if (!this.isOwner(requester)) {
      return false;
    }
    this.active = false;
    this.acceptedEnds++;
    return true;
  }

  public toString(): string {
    return `SessionBinding{owner=${this.owner}, id=${this.sessionId}, active=${this.active}}`;
  }
}

/**
 * Registry that reproduces the session rules of the assessment service.
 *
 * The service binds a session to the application that called begin, so a second begin while a
 * session is live is rejected and an end from another application is ignored.
 */
class SessionRegistry {
  private binding: SessionBinding | undefined = undefined;
  private beginAttempts: number = 0;
  private rejectedBegins: number = 0;
  private deniedEnds: number = 0;

  public begin(owner: string, sessionId: string): SessionBinding | undefined {
    this.beginAttempts++;
    if (this.binding !== undefined && this.binding.isActive()) {
      this.rejectedBegins++;
      return undefined;
    }
    this.binding = new SessionBinding(owner, sessionId, this.beginAttempts);
    return this.binding;
  }

  public active(): SessionBinding | undefined {
    if (this.binding === undefined || !this.binding.isActive()) {
      return undefined;
    }
    return this.binding;
  }

  public canEnd(requester: string): boolean {
    const binding: SessionBinding | undefined = this.active();
    if (binding === undefined) {
      return false;
    }
    return binding.isOwner(requester);
  }

  public end(requester: string): boolean {
    const binding: SessionBinding | undefined = this.active();
    if (binding === undefined) {
      return false;
    }
    const ended: boolean = binding.end(requester);
    if (!ended && binding.getEndAttempts() > 0 && binding.isActive()) {
      this.deniedEnds++;
    }
    return ended;
  }

  public reset(): void {
    this.binding = undefined;
    this.beginAttempts = 0;
    this.rejectedBegins = 0;
    this.deniedEnds = 0;
  }

  public getBeginAttempts(): number {
    return this.beginAttempts;
  }

  public getRejectedBegins(): number {
    return this.rejectedBegins;
  }

  public getDeniedEnds(): number {
    return this.deniedEnds;
  }

  public hasActiveSession(): boolean {
    return this.active() !== undefined;
  }

  public toString(): string {
    return `SessionRegistry{begins=${this.beginAttempts}, rejected=${this.rejectedBegins}, ` +
      `deniedEnds=${this.deniedEnds}}`;
  }
}

/**
 * Accumulates the findings of the permission and session validation.
 */
class ValidationReport {
  private issues: string[] = [];

  public add(issue: string): void {
    this.issues.push(issue);
  }

  public addAll(issues: string[]): void {
    for (let i = 0; i < issues.length; i++) {
      this.issues.push(issues[i]);
    }
  }

  public count(): number {
    return this.issues.length;
  }

  public hasIssues(): boolean {
    return this.issues.length > 0;
  }

  public all(): string[] {
    return this.issues.slice();
  }

  public clear(): void {
    this.issues = [];
  }

  public summary(): string {
    return `ValidationReport{issues=${this.issues.length}}`;
  }
}

/**
 * Reports whether the running image declares the assessment capability.
 *
 * @returns true when the SysCap is present.
 */
function isAssessmentSupported(): boolean {
  const supported: boolean = canIUse(SYSCAP_ASSESSMENT);
  if (!supported) {
    hilog.warn(DOMAIN, TAG, '%{public}s is absent on this image', SYSCAP_ASSESSMENT);
  }
  return supported;
}

export default function permissionSessionValidationTest() {
  describe('PermissionSessionValidation_Test', () => {
    let driver: Driver;
    let catalog: PermissionCatalog;
    let registry: SessionRegistry;
    let report: ValidationReport;

    beforeAll(async () => {
      driver = getDriver();
      catalog = new PermissionCatalog();
      registry = new SessionRegistry();
      report = new ValidationReport();
      await serializedDelay(driver, 500);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    
    /**
     * Scenario: inspect the primary permission of the assessment service.
     * Expectation: the permission is a system granted permission of the system_basic level,
     * so the user cannot revoke it once the application is installed.
     */
    it('Assessment_AssessmentPermissionDescriptor_002', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentPermissionDescriptor_002, begin');
      const descriptor: PermissionDescriptor | undefined = catalog.find(PERMISSION_ASSESSMENT);
      expect(descriptor !== undefined).assertTrue();
      if (descriptor !== undefined) {
        expect(descriptor.grantMode).assertEqual(GRANT_MODE_SYSTEM);
        expect(descriptor.availableLevel).assertEqual(LEVEL_SYSTEM_BASIC);
        expect(descriptor.secondary).assertFalse();
        expect(descriptor.reason.length > 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentPermissionDescriptor_002, end');
    });

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
      });
}
