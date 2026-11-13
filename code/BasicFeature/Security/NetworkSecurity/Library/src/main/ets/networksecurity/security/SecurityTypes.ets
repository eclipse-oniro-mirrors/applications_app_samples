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
 * A certificate shipped in rawfile/certs.
 */
export class CertFileItem {
  // Display name of the PEM certificate, for example ca_cert.pem.
  public fileName: string;
  // Short display label for the certificate list item.
  public label: ResourceStr;
  // Long description shown in the certificate detail area.
  public detail: ResourceStr;
  // Rawfile-relative path used to read the PEM content.
  public path: string;

  /**
   * Create an immutable certificate file descriptor.
   * @param fileName certificate file name inside rawfile/certs.
   * @param label short display label for the list item.
   * @param detail long description shown in the detail area.
   * @param path rawfile-relative path used to read the PEM content.
   */
  constructor(fileName: string, label: ResourceStr, detail: ResourceStr, path: string) {
    // Store the file name used for display and lookup.
    this.fileName = fileName;
    // Store the short display label.
    this.label = label;
    // Store the long description text.
    this.detail = detail;
    // Store the rawfile-relative path.
    this.path = path;
  }
}

/**
 * Metadata parsed from an X.509 certificate.
 */
export class CertMeta {
  // Issuer distinguished name decoded as UTF-8 text.
  public issuer: string;
  // Not-before validity time in the certificate's string form.
  public notBefore: string;
  // Not-after validity time in the certificate's string form.
  public notAfter: string;
  // X.509 version number, for example 3.
  public version: number;
  // Serial number rendered as a decimal string.
  public serial: string;

  /**
   * Create an immutable certificate metadata record.
   * @param issuer issuer distinguished name decoded as UTF-8 text.
   * @param notBefore not-before validity time in string form.
   * @param notAfter not-after validity time in string form.
   * @param version X.509 version number of the certificate.
   * @param serial serial number rendered as a decimal string.
   */
  constructor(issuer: string, notBefore: string, notAfter: string, version: number, serial: string) {
    // Store the issuer distinguished name.
    this.issuer = issuer;
    // Store the not-before validity time.
    this.notBefore = notBefore;
    // Store the not-after validity time.
    this.notAfter = notAfter;
    // Store the X.509 version number.
    this.version = version;
    // Store the serial number string.
    this.serial = serial;
  }
}

/**
 * Create a placeholder metadata record with empty fields.
 * @returns a CertMeta whose fields are empty or zero, used before parsing finishes.
 */
export function createEmptyCertMeta(): CertMeta {
  // Return an all-empty instance so the UI has a stable object to render.
  return new CertMeta('', '', '', 0, '');
}

/**
 * Result of a certificate verification call.
 */
export class CertVerifyResult {
  // Certificate file name the result belongs to, empty when not applicable.
  public fileName: string;
  // True when the certificate passed verification.
  public success: boolean;
  // Verification or BusinessError code, 0 means success.
  public code: number;
  // Human readable outcome description.
  public message: string;
  // Elapsed verification time in milliseconds.
  public elapsedMs: number;

  /**
   * Create an immutable verification outcome record.
   * @param fileName certificate file name the result belongs to.
   * @param success true when the certificate passed verification.
   * @param code verification or BusinessError code, 0 means success.
   * @param message human readable outcome description.
   * @param elapsedMs elapsed verification time in milliseconds.
   */
  constructor(fileName: string, success: boolean, code: number, message: string, elapsedMs: number) {
    // Store the certificate file name of this result.
    this.fileName = fileName;
    // Store the verification outcome flag.
    this.success = success;
    // Store the verification or error code.
    this.code = code;
    // Store the human readable outcome description.
    this.message = message;
    // Store the elapsed verification time.
    this.elapsedMs = elapsedMs;
  }
}

/**
 * Create a placeholder verification result before real verification runs.
 * @returns a CertVerifyResult marked as not yet verified.
 */
export function createEmptyVerifyResult(): CertVerifyResult {
  // Return an all-empty failing instance so the UI has a stable object to render.
  return new CertVerifyResult('', false, 0, '', 0);
}

/**
 * Cleartext HTTP policy result for the global switch and one host name.
 */
export class CleartextResult {
  // True when base-config allows cleartext traffic globally.
  public globalAllowed: boolean;
  // Host name that was queried.
  public host: string;
  // True when the host is allowed by base-config or domain-config.
  public hostAllowed: boolean;

  /**
   * Create an immutable cleartext policy outcome record.
   * @param globalAllowed true when base-config allows cleartext traffic globally.
   * @param host host name that was queried.
   * @param hostAllowed true when the host is allowed by the policy.
   */
  constructor(globalAllowed: boolean, host: string, hostAllowed: boolean) {
    // Store the global cleartext switch value.
    this.globalAllowed = globalAllowed;
    // Store the queried host name.
    this.host = host;
    // Store the per host cleartext decision.
    this.hostAllowed = hostAllowed;
  }
}

/**
 * One HTTP probe outcome.
 */
export class HttpProbeResult {
  // Requested URL.
  public url: string;
  // True when the HTTP status is in the 2xx/3xx range.
  public success: boolean;
  // HTTP response status code, 0 when the request failed before a response arrived.
  public httpCode: number;
  // BusinessError code, 0 when the request succeeded, -1 when unknown.
  public errorCode: number;
  // Elapsed probe time in milliseconds.
  public elapsedMs: number;
  // Human readable outcome description.
  public message: string;

  /**
   * Create an immutable probe outcome record.
   * @param url requested URL.
   * @param success true when the HTTP status is in the 2xx/3xx range.
   * @param httpCode HTTP response status code, 0 when no response arrived.
   * @param errorCode BusinessError code, 0 on success, -1 when unknown.
   * @param elapsedMs elapsed probe time in milliseconds.
   * @param message human readable outcome description.
   */
  constructor(url: string, success: boolean, httpCode: number, errorCode: number, elapsedMs: number,
    message: string) {
    // Store the requested URL.
    this.url = url;
    // Store the success flag derived from the HTTP status.
    this.success = success;
    // Store the HTTP response status code.
    this.httpCode = httpCode;
    // Store the BusinessError code of a failed request.
    this.errorCode = errorCode;
    // Store the elapsed probe time.
    this.elapsedMs = elapsedMs;
    // Store the human readable outcome description.
    this.message = message;
  }
}

/**
 * One runtime environment check item.
 */
export class EnvironmentCheck {
  // Display label of the check item.
  public label: ResourceStr;
  // Observed value rendered as display text.
  public value: string;
  // True when the check item meets the expectation.
  public passed: boolean;

  /**
   * Create an immutable environment check item.
   * @param label display label of the check item.
   * @param value observed value rendered as display text.
   * @param passed true when the check item meets the expectation.
   */
  constructor(label: ResourceStr, value: string, passed: boolean) {
    // Store the display label.
    this.label = label;
    // Store the observed value text.
    this.value = value;
    // Store the pass flag of this check.
    this.passed = passed;
  }
}

/**
 * Human readable explanation of an error code.
 */
export class SecurityErrorExplain {
  // Numeric error code from networkSecurity, http or connection APIs.
  public code: number;
  // Short title shown for the error.
  public title: ResourceStr;
  // Possible cause description.
  public reason: ResourceStr;
  // Suggested fix presented to the user.
  public suggestion: ResourceStr;
  // Severity level, for example error or warning.
  public level: string;

  /**
   * Create an immutable error explanation record.
   * @param code numeric error code from networkSecurity, http or connection APIs.
   * @param title short title shown for the error.
   * @param reason possible cause description.
   * @param suggestion suggested fix presented to the user.
   * @param level severity level, for example error or warning.
   */
  constructor(code: number, title: ResourceStr, reason: ResourceStr, suggestion: ResourceStr, level: string) {
    // Store the numeric error code.
    this.code = code;
    // Store the short error title.
    this.title = title;
    // Store the cause description.
    this.reason = reason;
    // Store the suggested fix.
    this.suggestion = suggestion;
    // Store the severity level.
    this.level = level;
  }
}
