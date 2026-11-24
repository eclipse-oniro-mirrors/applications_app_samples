/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import cipher, { CipherResponse } from '@system.cipher';
import { util } from '@kit.ArkTS';
import Logger from './Logger';

const TAG: string = '[Sample_Cipher]';
const RSA_OAEP_MAX_PLAINTEXT_BYTES: number = 62;
const RSA_CIPHERTEXT_BASE64_LENGTH: number = 172;
const BASE64_ALPHABET: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=';
const AES_ENCRYPT_KEY: string = 'NDM5Qjk2UjAzMEE0NzVCRjlFMkQwQkVGOFc1NkM1QkQ=';
const RSA_ENCRYPT_KEY: string = 'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCx414QSP3RsYWYzf9mkBMiBAXo\n' +
'6S7Lpva1fKlcuVxjoFC1iMnzD4mC0uiL4k5MNi43J64c7dbqi3qAJjdAtuwQ6NZJ\n' +
'+Enz0RzmVFh/4yk6lmqRzuEFQqhQqSZzaLq6sq2N2G0Sv2Xl3sLvqAfe2HNm2oBw\n' +
'jBpApTJ3TeneOo6Z5QIDAQAB';
const RSA_DECRYPT_KEY: string = 'MIICXgIBAAKBgQCx414QSP3RsYWYzf9mkBMiBAXo6S7Lpva1fKlcuVxjoFC1iMnz\n' +
'D4mC0uiL4k5MNi43J64c7dbqi3qAJjdAtuwQ6NZJ+Enz0RzmVFh/4yk6lmqRzuEF\n' +
'QqhQqSZzaLq6sq2N2G0Sv2Xl3sLvqAfe2HNm2oBwjBpApTJ3TeneOo6Z5QIDAQAB\n' +
'AoGBAKPNtoRQcklxqo+2wQP0j2m3Qqnib1DggjVEgb/8f/LNYQSI3U2QdROemryU\n' +
'u3y6N3xacZ359PktTrRKfH5+8ohmHGhIuPAnefp6bLvAFUcl4t1xm74Cow62Kyw3\n' +
'aSbmuTG98dxPA1sXD0jiprdtsq2wQ9CoKNyY7/d/pKoqxNuBAkEA4GytZ60NCTj9\n' +
'w24jACFeko5YqCFY/TTLoc4SQvWtFMnimRPclLZhtUIK0P8dib71UFedx+AxklgL\n' +
'A5gjcfo+2QJBAMrqiwyCh3OQ5DhyRPDwt87x1/jg5fy4hhete2ufSf2FoQCVqO+w\n' +
'PKoljdXmJeS6rGgzGibstuHLrP3tcIho4+0CQD3ZFWzF/xq0jxKlrpWhnJuNCRfE\n' +
'oO6e9yNvVA8J/5oEDSOcmqSNIp4+RhbUx8InUxnCG6Ryv5aSFu71pYcKrPkCQQCL\n' +
'RUGcm3ZGTnslduB0knNF+V2ndwzDUQ7P74UXT+PjurTPhujFYiuxCEd6ORVnEOzG\n' +
'M9TORIgdH8MjIbWsGnndAkEAw9yURDaorE8IYPLF2IEn09g1uzvWPs3phDb6smVx\n' +
'8GfqIdUNf+aCG5TZK/kXBF1sqcsi7jXMAf4jBlejVbSVZg==';

export class CipherModel {
  public rsaEncrypt(message: string, callback: (result: CipherResponse) => void): void {
    const inputBytes: number = this.utf8ByteLength(message);
    if (inputBytes > RSA_OAEP_MAX_PLAINTEXT_BYTES) {
      Logger.info(TAG, `rsaEncrypt input exceeds OAEP limit: ${inputBytes} bytes`);
      callback({ text: 'Error!' });
      return;
    }
    let result: CipherResponse = { text: '' };
    cipher.rsa({
      // 加密
      action: 'encrypt',
      // 待加密的文本内容
      text: message,
      // base64编码后的加密公钥
      key: RSA_ENCRYPT_KEY,
      transformation: 'RSA/None/OAEPWithSHA256AndMGF1Padding',
      success: (info: CipherResponse) => {
        result = info;
        if (info.text !== undefined) {
          result.text = this.trimTrailingNull(info.text);
        } else {
          result.text = 'Error!';
        }
        Logger.info(TAG, `result = ${JSON.stringify(result)}`);
        callback(result);
      },
      fail: (data: string, code: number) => {
        result = { text: 'Error!' };
        Logger.debug(TAG, `cipher.rsa encrypt fail ${JSON.stringify(code)}: ${JSON.stringify(data)}`);
        callback(result);
      },
      complete: () => {
        Logger.info(TAG, `encrypt is success`);
      }
    });
  }

  public rsaDecrypt(message: string, callback: (result: CipherResponse) => void): void {
    let result: CipherResponse = { text: '' };
    const input: string = this.trimTrailingNull(message);
    if (!this.isRsaCiphertext(input)) {
      result = { text: 'Error!' };
      Logger.info(TAG, `rsaDecrypt input is not a valid RSA ciphertext, length = ${input.length}`);
      callback(result);
      return;
    }
    cipher.rsa({
      // 解密：
      action: 'decrypt',
      // 待解密的内容
      text: input,
      // base64编码后的解密私钥
      key: RSA_DECRYPT_KEY,
      success: (info: CipherResponse) => {
        result = info;
        Logger.info(TAG, `result = ${JSON.stringify(result)}`);
        callback(result);
      },
      fail: (data: string, code: number) => {
        result = { text: 'Error!' };
        Logger.debug(TAG, `cipher.rsa decrypt fail ${JSON.stringify(code)}: ${JSON.stringify(data)}`);
        callback(result);
      },
      complete: () => {
        Logger.info(TAG, `encrypt is success`);
      }
    });
  }

  public aesEncrypt(message: string, callback: (result: CipherResponse) => void): void {
    let result: CipherResponse = { text: '' };
    cipher.aes({
      // 加密
      action: 'encrypt',
      // 待加密的文本内容
      text: message,
      // base64编码后的密钥
      key: AES_ENCRYPT_KEY,
      transformation: 'AES/CBC/PKCS5Padding',
      ivOffset: '0',
      ivLen: '16',
      success: (info: CipherResponse) => {
        result = info;
        Logger.info(TAG, `result = ${JSON.stringify(result)}`);
        callback(result);
      },
      fail: (data: string, code: number) => {
        result = { text: 'Error!' };
        Logger.debug(TAG, `cipher.aes encrypt fail ${JSON.stringify(code)}: ${JSON.stringify(data)}`);
        callback(result);
      },
      complete: () => {
        Logger.info(TAG, `encrypt is success`);
      }
    });
  }

  public aesDecrypt(message: string, callback: (result: CipherResponse) => void): void {
    let result: CipherResponse = { text: '' };
    cipher.aes({
      // 解密：
      action: 'decrypt',
      // 待解密的内容，是base64编码后的一段二进制值
      text: message,
      // base64编码后的密钥
      key: AES_ENCRYPT_KEY,
      transformation: 'AES/CBC/PKCS5Padding',
      ivOffset: '0',
      ivLen: '16',
      success: (info: CipherResponse) => {
        result = info;
        Logger.info(TAG, `data = ${JSON.stringify(result)}`);
        callback(result);
      },
      fail: (data: string, code: number) => {
        result = { text: 'Error!' };
        Logger.debug(TAG, `cipher.aes encrypt fail ${JSON.stringify(code)}: ${JSON.stringify(data)}`);
        callback(result);
      },
      complete: () => {
        Logger.info(TAG, `encrypt is success`);
      }
    });
  }

  private trimTrailingNull(text: string): string {
    let end: number = text.length;
    while (end > 0 && text.charCodeAt(end - 1) === 0) {
      end--;
    }
    return text.substring(0, end);
  }

  private utf8ByteLength(text: string): number {
    if (text.length === 0) {
      return 0;
    }
    const encoded: Uint8Array = new util.TextEncoder().encodeInto(text);
    if (encoded === undefined) {
      return 0;
    }
    return encoded.length;
  }

  private isRsaCiphertext(text: string): boolean {
    if (text.length !== RSA_CIPHERTEXT_BASE64_LENGTH) {
      return false;
    }
    for (let i: number = 0; i < text.length; i++) {
      if (BASE64_ALPHABET.indexOf(text.charAt(i)) < 0) {
        return false;
      }
    }
    return true;
  }
}