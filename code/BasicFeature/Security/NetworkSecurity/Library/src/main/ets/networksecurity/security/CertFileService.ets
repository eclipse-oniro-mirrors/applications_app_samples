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

import { common } from '@kit.AbilityKit';
import { util } from '@kit.ArkTS';
import { cert } from '@kit.DeviceCertificateKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { CertFileItem, CertMeta } from './SecurityTypes';
import { Logger } from '../utils/Logger';

// Rawfile sub-directory holding the bundled PEM certificates.
const CERTS_DIR: string = 'certs/';
// Rawfile path of the root CA certificate used as trust anchor.
const CA_PATH: string = CERTS_DIR + 'ca_cert.json';
// Rawfile path of the server certificate.
const SERVER_PATH: string = CERTS_DIR + 'server_cert.json';
// Rawfile path of the self signed certificate.
const SELF_SIGNED_PATH: string = CERTS_DIR + 'self_signed_cert.json';
// Rawfile path of the expired certificate.
const EXPIRED_PATH: string = CERTS_DIR + 'expired_cert.json';
// Sentinel length meaning an empty string or list.
const EMPTY_LENGTH: number = 0;

/**
 * Loads the bundled PEM certificates from rawfile and reads their metadata.
 */
export class CertFileService {
  /**
   * Returns the four built-in certificates in a fixed order: root CA, server, self signed, expired.
   */
  static load(context: common.Context): CertFileItem[] {
    // Open the trace section for the profiler before doing any work.
    Logger.beginTrace('NetworkSecurity.security.load', 1);
    Logger.enter('[CertFileService#load]', 'params: none');
    // Describe the four built-in certificates with labels and rawfile paths.
    const items: CertFileItem[] = [
      // Root CA used as the verification trust anchor.
      new CertFileItem('ca_cert.pem', $r('app.string.ns_sec_cert_ca_label'),
        $r('app.string.ns_sec_cert_ca_detail'), CA_PATH),
      // Server certificate presented by the demo server.
      new CertFileItem('server_cert.pem', $r('app.string.ns_sec_cert_server_label'),
        $r('app.string.ns_sec_cert_server_detail'), SERVER_PATH),
      // Self signed certificate to demonstrate a broken trust chain.
      new CertFileItem('self_signed_cert.pem', $r('app.string.ns_sec_cert_self_label'),
        $r('app.string.ns_sec_cert_self_detail'), SELF_SIGNED_PATH),
      // Expired certificate to demonstrate validity date checking.
      new CertFileItem('expired_cert.pem', $r('app.string.ns_sec_cert_expired_label'),
        $r('app.string.ns_sec_cert_expired_detail'), EXPIRED_PATH)
    ];
    Logger.info('[CertFile] Built-in certificate list prepared, count ' + items.length.toString());
    Logger.exit('[CertFileService#load]', 'result: count ' + items.length.toString());
    // Close the trace section before returning the certificate list.
    Logger.endTrace('NetworkSecurity.security.load', 1);
    return items;
  }

  /**
   * Reads PEM text stored as a JSON string in rawfile, for example certs/ca_cert.json.
   * Returns an empty string when the file cannot be read.
   */
  static readPem(context: common.Context, rawFilePath: string): string {
    // Open the trace section for the profiler before doing any work.
    Logger.beginTrace('NetworkSecurity.security.readPem', 1);
    Logger.enter('[CertFileService#readPem]', 'params: rawFilePath ' + rawFilePath);
    // Rawfile reads are synchronous and may throw when the path does not exist.
    try {
      // Read the raw file bytes synchronously from the resource manager.
      const bytes: Uint8Array = context.resourceManager.getRawFileContentSync(rawFilePath);
      Logger.exit('[CertFileService#readPem]', 'result: pem text');
      // Close the trace section before returning the decoded PEM text.
      Logger.endTrace('NetworkSecurity.security.readPem', 1);
      // JSON decoding preserves the original PEM text while keeping the resource text-only.
      const text: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      const pem: string = JSON.parse(text);
      return pem;
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.warn('[CertFile] Failed to read ' + rawFilePath + ', code ' + err.code.toString());
      Logger.exit('[CertFileService#readPem]', 'result: empty string, read failed');
      // Close the trace section before returning the empty fallback.
      Logger.endTrace('NetworkSecurity.security.readPem', 1);
      // Return an empty string so callers can react without exception handling.
      return '';
    }
  }

  /**
   * Parses issuer, validity, version and serial number from a PEM file.
   * Returns undefined when the file cannot be read or parsed.
   */
  static async readMeta(context: common.Context, fileName: string): Promise<CertMeta | undefined> {
    // Open the trace section for the profiler before doing any work.
    Logger.beginTrace('NetworkSecurity.security.readMeta', 1);
    Logger.enter('[CertFileService#readMeta]', 'params: fileName ' + fileName);
    // Read the PEM text first; an empty text means the file is missing or unreadable.
    const pem: string = CertFileService.readPem(context, fileName);
    // Give up early when the PEM text could not be read.
    if (pem.length === EMPTY_LENGTH) {
      Logger.warn('[CertFile] Cannot parse metadata, empty PEM for ' + fileName);
      Logger.exit('[CertFileService#readMeta]', 'result: undefined, empty PEM');
      // Close the trace section before returning the empty outcome.
      Logger.endTrace('NetworkSecurity.security.readMeta', 1);
      return undefined;
    }
    // Parse the PEM into an X509Cert and extract its metadata.
    try {
      // Build the encoding blob expected by the certificate framework.
      const blob: cert.EncodingBlob = {
        data: new util.TextEncoder().encodeInto(pem),
        encodingFormat: cert.EncodingFormat.FORMAT_PEM
      };
      // Parse the certificate asynchronously.
      const x509: cert.X509Cert = await cert.createX509Cert(blob);
      // Collect issuer, validity, version and serial into the metadata record.
      const meta: CertMeta = new CertMeta(x509.getIssuerName(cert.EncodingType.ENCODING_UTF8), x509.getNotBeforeTime(),
        x509.getNotAfterTime(), x509.getVersion(), x509.getSerialNumber().toString());
      Logger.info('[CertFile] Parsed metadata of ' + fileName);
      Logger.exit('[CertFileService#readMeta]', 'result: issuer ' + meta.issuer);
      // Close the trace section before returning the parsed metadata.
      Logger.endTrace('NetworkSecurity.security.readMeta', 1);
      return meta;
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.warn('[CertFile] Failed to parse ' + fileName + ', code ' + err.code.toString());
      Logger.exit('[CertFileService#readMeta]', 'result: undefined, parse failed');
      // Close the trace section before returning the failure outcome.
      Logger.endTrace('NetworkSecurity.security.readMeta', 1);
      return undefined;
    }
  }
}
