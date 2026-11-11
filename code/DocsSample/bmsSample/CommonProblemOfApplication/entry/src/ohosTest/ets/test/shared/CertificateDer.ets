/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { decodeBase64ToBytes } from './BundleOracle';

const PEM_BEGIN: string = '-----BEGIN CERTIFICATE-----';
const PEM_END: string = '-----END CERTIFICATE-----';

export class CertificateFormatError extends Error {
  readonly reason: string;

  constructor(reason: string) {
    super(reason);
    this.reason = reason;
  }
}

export function stripPemHeaders(text: string): string {
  return text
    .replace(/\r/g, '\n')
    .split(PEM_BEGIN).join('')
    .split(PEM_END).join('')
    .split('\n').join('')
    .split(' ').join('')
    .split('\t').join('');
}

// signatureInfo.certificate carries either a single PEM block or a concatenation of blocks
// (leaf first, then intermediates). The oracle only needs the leaf, which is block zero.
export function firstPemBlock(text: string): string {
  const beginIndex: number = text.indexOf(PEM_BEGIN);
  if (beginIndex < 0) {
    return stripPemHeaders(text);
  }
  const bodyStart: number = beginIndex + PEM_BEGIN.length;
  const endIndex: number = text.indexOf(PEM_END, bodyStart);
  if (endIndex < 0) {
    throw new CertificateFormatError('PEM certificate block is not terminated');
  }
  return stripPemHeaders(text.substring(bodyStart, endIndex));
}

export function certificateToDer(certificateText: string): Uint8Array {
  const body: string = firstPemBlock(certificateText);
  if (body.length === 0) {
    throw new CertificateFormatError('certificate block is empty');
  }
  return decodeBase64ToBytes(body);
}

export function countPemBlocks(text: string): number {
  let count: number = 0;
  let cursor: number = 0;
  while (true) {
    const next: number = text.indexOf(PEM_BEGIN, cursor);
    if (next < 0) {
      return count;
    }
    count++;
    cursor = next + PEM_BEGIN.length;
  }
}

export function looksLikePem(text: string): boolean {
  return text.indexOf(PEM_BEGIN) >= 0 && text.indexOf(PEM_END) >= 0;
}

export function derLooksLikeX509(der: Uint8Array): boolean {
  return der.length > 8 && der[0] === 0x30 && der[1] === 0x82;
}

export function pemBodyLineLengths(text: string): number[] {
  const body: string = firstPemBlock(text);
  const lengths: number[] = [];
  for (let i: number = 0; i < body.length; i += 64) {
    lengths.push(Math.min(64, body.length - i));
  }
  return lengths;
}
