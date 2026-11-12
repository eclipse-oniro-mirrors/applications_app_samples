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

import { networkSecurity } from '@kit.NetworkKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { CertVerifyResult } from './SecurityTypes';
import { elapsedMilliseconds } from '../utils/Format';
import { Logger } from '../utils/Logger';

// Numeric code returned by verification APIs when the certificate passes.
const SUCCESS_CODE: number = 0;
// Fallback error code when no positive platform code is available.
const UNKNOWN_CODE: number = -1;

/**
 * Wrap a PEM text into the CertBlob structure expected by networkSecurity APIs.
 * @param pemText certificate content in PEM encoding.
 * @returns a CertBlob marked as PEM holding the given data.
 */
function toCertBlob(pemText: string): networkSecurity.CertBlob {
  // Fill the blob type and data fields required by the verification APIs.
  const blob: networkSecurity.CertBlob = {
    type: networkSecurity.CertType.CERT_TYPE_PEM,
    data: pemText
  };
  // Return the prepared blob to the caller.
  return blob;
}

/**
 * Wraps the three networkSecurity certificate verification APIs.
 * A return code of 0 means the certificate passed verification; failures are reported as BusinessError codes.
 */
export class CertVerifyService {
  /**
   * Verify one certificate synchronously, optionally against a trusted CA.
   * @param certPem certificate to verify, in PEM encoding.
   * @param caPem optional trusted CA certificate in PEM encoding.
   * @returns the verification result with code and elapsed time; never throws.
   */
  static verifySync(certPem: string, caPem?: string): CertVerifyResult {
    // Open the trace section for the profiler before doing any work.
    Logger.beginTrace('NetworkSecurity.security.verifySync', 1);
    Logger.enter('[CertVerifyService#verifySync]',
      'params: certPem length ' + certPem.length.toString() + ', hasCa ' + (caPem !== undefined).toString());
    // Record the start time to compute the elapsed duration.
    const startedAt: number = Date.now();
    // Run the synchronous verification; the call may throw a BusinessError.
    try {
      // Default to the success code until verification reports otherwise.
      let code: number = SUCCESS_CODE;
      // Verify against the provided CA when one is available.
      if (caPem !== undefined && caPem.length > 0) {
        code = networkSecurity.certVerificationSync(toCertBlob(certPem), toCertBlob(caPem));
      } else {
        // Verify the certificate with its own trust anchors.
        code = networkSecurity.certVerificationSync(toCertBlob(certPem));
      }
      // Code 0 means the certificate passed verification.
      const success: boolean = code === SUCCESS_CODE;
      // Build the human readable outcome message.
      const message: string = success ? 'Verification passed' : 'Verification returned code ' + code.toString();
      Logger.info('[CertVerify] Sync verification finished, code ' + code.toString());
      Logger.exit('[CertVerifyService#verifySync]', 'result: success ' + success.toString() + ', code ' +
        code.toString());
      // Close the trace section before returning the verification result.
      Logger.endTrace('NetworkSecurity.security.verifySync', 1);
      return new CertVerifyResult('', success, code, message, elapsedMilliseconds(startedAt));
    } catch (error) {
      // Normalize the thrown value into a BusinessError to read its code.
      const err: BusinessError = error as BusinessError;
      // Use the platform error code, or -1 when no positive code is available.
      const code: number = err.code > 0 ? err.code : UNKNOWN_CODE;
      Logger.warn('[CertVerify] Sync verification failed, code ' + code.toString());
      Logger.exit('[CertVerifyService#verifySync]', 'result: failed, code ' + code.toString());
      // Close the trace section before returning the failure result.
      Logger.endTrace('NetworkSecurity.security.verifySync', 1);
      return new CertVerifyResult('', false, code, 'Verification failed, code ' + code.toString(),
        elapsedMilliseconds(startedAt));
    }
  }

  /**
   * Verify one certificate asynchronously, optionally against a trusted CA.
   * @param certPem certificate to verify, in PEM encoding.
   * @param caPem optional trusted CA certificate in PEM encoding.
   * @returns the verification result with code and elapsed time; never throws.
   */
  static async verifyAsync(certPem: string, caPem?: string): Promise<CertVerifyResult> {
    // Open the trace section for the profiler before doing any work.
    Logger.beginTrace('NetworkSecurity.security.verifyAsync', 1);
    Logger.enter('[CertVerifyService#verifyAsync]',
      'params: certPem length ' + certPem.length.toString() + ', hasCa ' + (caPem !== undefined).toString());
    // Record the start time to compute the elapsed duration.
    const startedAt: number = Date.now();
    // Run the asynchronous verification; the call may throw a BusinessError.
    try {
      // Default to the success code until verification reports otherwise.
      let code: number = SUCCESS_CODE;
      // Verify against the provided CA when one is available.
      if (caPem !== undefined && caPem.length > 0) {
        code = await networkSecurity.certVerification(toCertBlob(certPem), toCertBlob(caPem));
      } else {
        // Verify the certificate with its own trust anchors.
        code = await networkSecurity.certVerification(toCertBlob(certPem));
      }
      // Code 0 means the certificate passed verification.
      const success: boolean = code === SUCCESS_CODE;
      // Build the human readable outcome message.
      const message: string = success ? 'Verification passed' : 'Verification returned code ' + code.toString();
      Logger.info('[CertVerify] Async verification finished, code ' + code.toString());
      Logger.exit('[CertVerifyService#verifyAsync]', 'result: success ' + success.toString() + ', code ' +
        code.toString());
      // Close the trace section before returning the verification result.
      Logger.endTrace('NetworkSecurity.security.verifyAsync', 1);
      return new CertVerifyResult('', success, code, message, elapsedMilliseconds(startedAt));
    } catch (error) {
      // Normalize the thrown value into a BusinessError to read its code.
      const err: BusinessError = error as BusinessError;
      // Use the platform error code, or -1 when no positive code is available.
      const code: number = err.code > 0 ? err.code : UNKNOWN_CODE;
      Logger.warn('[CertVerify] Async verification failed, code ' + code.toString());
      Logger.exit('[CertVerifyService#verifyAsync]', 'result: failed, code ' + code.toString());
      // Close the trace section before returning the failure result.
      Logger.endTrace('NetworkSecurity.security.verifyAsync', 1);
      return new CertVerifyResult('', false, code, 'Verification failed, code ' + code.toString(),
        elapsedMilliseconds(startedAt));
    }
  }

  /**
   * Builds and validates the chain server -> root CA and checks the host name against the certificate SAN.
   * The resolved chain (leaf to root) length is reported in the result message.
   */
  static async verifyChain(serverPem: string, caPem: string, hostname: string): Promise<CertVerifyResult> {
    // Open the trace section for the profiler before doing any work.
    Logger.beginTrace('NetworkSecurity.security.verifyChain', 1);
    Logger.enter('[CertVerifyService#verifyChain]',
      'params: serverPem length ' + serverPem.length.toString() + ', host ' + hostname);
    // Record the start time to compute the elapsed duration.
    const startedAt: number = Date.now();
    // Build and verify the chain; the call may throw a BusinessError.
    try {
      // Chain input holds only the leaf certificate; the CA anchors the verification.
      const chainInput: networkSecurity.CertBlob[] = [toCertBlob(serverPem)];
      // Verify the chain and check the host name against the certificate SAN.
      const resolved: networkSecurity.CertBlob[] =
        await networkSecurity.verifyCertChain(chainInput, toCertBlob(caPem), hostname);
      // Build the human readable outcome message.
      const message: string = 'Chain verified, length ' + resolved.length.toString() + ', host ' + hostname;
      Logger.info('[CertVerify] Chain verification finished, length ' + resolved.length.toString());
      Logger.exit('[CertVerifyService#verifyChain]', 'result: success, length ' + resolved.length.toString());
      // Close the trace section before returning the verification result.
      Logger.endTrace('NetworkSecurity.security.verifyChain', 1);
      return new CertVerifyResult('', true, SUCCESS_CODE, message, elapsedMilliseconds(startedAt));
    } catch (error) {
      // Normalize the thrown value into a BusinessError to read its code.
      const err: BusinessError = error as BusinessError;
      // Use the platform error code, or -1 when no positive code is available.
      const code: number = err.code > 0 ? err.code : UNKNOWN_CODE;
      Logger.warn('[CertVerify] Chain verification failed, code ' + code.toString());
      Logger.exit('[CertVerifyService#verifyChain]', 'result: failed, code ' + code.toString());
      // Close the trace section before returning the failure result.
      Logger.endTrace('NetworkSecurity.security.verifyChain', 1);
      return new CertVerifyResult('', false, code, 'Chain verification failed, code ' + code.toString(),
        elapsedMilliseconds(startedAt));
    }
  }
}
