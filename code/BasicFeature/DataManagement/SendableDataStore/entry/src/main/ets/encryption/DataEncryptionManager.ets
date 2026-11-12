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

import { DataValidator } from '../utils/DataValidator';
import { DataStoreConstants } from '../constants/DataStoreConstants';
import { EncryptionConfig, EncryptionMode, HashAlgorithm } from '../models/DataModels';
import { Logger } from '../utils/Logger';
import { ResultText } from '../utils/ResultText';

const DEFAULT_KEY_LENGTH: number = 256;
const DEFAULT_IV_LENGTH: number = 16;
const MIN_KEY_LENGTH: number = 16;
const MAX_KEY_LENGTH: number = 512;

/**
 * DataEncryptionManager provides encryption/decryption simulation,
 * key management, mode configuration, and hash computation utilities.
 */
export class DataEncryptionManager {
  private encryptionMode: EncryptionMode = EncryptionMode.NONE;
  private hashAlgorithm: HashAlgorithm = HashAlgorithm.SHA_256;
  private keyLength: number = DEFAULT_KEY_LENGTH;
  private ivLength: number = DEFAULT_IV_LENGTH;
  private autoEncrypt: boolean = false;
  private encryptionKey: string = '';
  private keyGenerated: boolean = false;
  private encryptCount: number = 0;
  private decryptCount: number = 0;
  private hashCount: number = 0;
  private createdAt: number = 0;
  private lastEncryptTime: number = 0;
  private lastDecryptTime: number = 0;

  constructor() {
  }

  initialize(mode: EncryptionMode, algorithm: HashAlgorithm): string {
    this.encryptionMode = mode;
    this.hashAlgorithm = algorithm;
    this.keyLength = DEFAULT_KEY_LENGTH;
    this.ivLength = DEFAULT_IV_LENGTH;
    this.autoEncrypt = false;
    this.encryptionKey = '';
    this.keyGenerated = false;
    this.encryptCount = 0;
    this.decryptCount = 0;
    this.hashCount = 0;
    this.createdAt = Date.now();
    return ResultText.ofArgs($r('app.string.result_encryption_initialized'),
      [String(mode), String(algorithm)],
      `Encryption manager initialized: mode=${mode}, algorithm=${algorithm}`);
  }

  configure(config: EncryptionConfig): string {
    if (!DataValidator.isValidEncryptionMode(config.mode)) {
      return ResultText.of($r('app.string.result_encryption_configure_invalid_mode'),
        'configure failed: invalid encryption mode');
    }
    if (!DataValidator.isValidHashAlgorithm(config.hashAlgorithm)) {
      return ResultText.of($r('app.string.result_encryption_configure_invalid_hash'),
        'configure failed: invalid hash algorithm');
    }
    if (config.keyLength < MIN_KEY_LENGTH || config.keyLength > MAX_KEY_LENGTH) {
      return ResultText.ofArgs($r('app.string.result_encryption_configure_key_length'), [config.keyLength],
        `configure failed: keyLength ${config.keyLength} out of range`);
    }
    this.encryptionMode = config.mode;
    this.hashAlgorithm = config.hashAlgorithm;
    this.keyLength = config.keyLength;
    this.ivLength = config.ivLength;
    this.autoEncrypt = config.autoEncrypt;
    this.createdAt = Date.now();
    return ResultText.ofArgs($r('app.string.result_encryption_configure_completed'),
      [String(config.mode), config.keyLength, String(config.autoEncrypt)],
      `configure completed: mode=${config.mode}, keyLen=${config.keyLength}, auto=${config.autoEncrypt}`);
  }

  generateKey(): string {
    const chars: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    let key: string = '';
    const effectiveLength: number = Math.floor(this.keyLength / 8);
    const genLength: number = effectiveLength > 0 ? effectiveLength : 32;
    for (let i: number = 0; i < genLength && i < 128; i++) {
      const idx: number = Math.floor(Math.random() * chars.length);
      key += chars.charAt(idx);
    }
    this.encryptionKey = key;
    this.keyGenerated = true;
    return ResultText.ofArgs($r('app.string.result_encryption_generate_key_completed'),
      [key.length, String(this.encryptionMode)],
      `generateKey completed: length=${key.length}, mode=${this.encryptionMode}`);
  }

  getKey(): string {
    if (!this.keyGenerated) {
      return ResultText.of($r('app.string.result_encryption_get_key_failed'), 'getKey failed: no key generated');
    }
    return ResultText.ofArgs($r('app.string.result_encryption_key'),
      [this.encryptionKey.substring(0, 8), this.encryptionKey.substring(this.encryptionKey.length - 4)],
      `Key: ${this.encryptionKey.substring(0, 8)}...${this.encryptionKey.substring(this.encryptionKey.length - 4)}`);
  }

  getKeyLength(): number {
    return this.keyLength;
  }

  setKey(key: string): string {
    if (key.length < MIN_KEY_LENGTH) {
      return ResultText.ofArgs($r('app.string.result_encryption_set_key_too_short'), [key.length, MIN_KEY_LENGTH],
        `setKey failed: key too short (${key.length} < ${MIN_KEY_LENGTH})`);
    }
    this.encryptionKey = key;
    this.keyGenerated = true;
    return ResultText.ofArgs($r('app.string.result_encryption_set_key_completed'), [key.length],
      `setKey completed: length=${key.length}`);
  }

  encrypt(plainText: string): string {
    if (!this.keyGenerated) {
      return ResultText.of($r('app.string.result_encryption_encrypt_no_key'), 'encrypt failed: no encryption key');
    }
    if (this.encryptionMode === EncryptionMode.NONE) {
      return ResultText.of($r('app.string.result_encryption_encrypt_mode_none'),
        'encrypt failed: encryption mode is NONE');
    }
    if (plainText.length === 0) {
      return ResultText.of($r('app.string.result_encryption_encrypt_empty'), 'encrypt failed: empty plaintext');
    }
    if (plainText.length > DataStoreConstants.MAX_VALUE_LENGTH) {
      return ResultText.of($r('app.string.result_encryption_encrypt_exceeds_max'),
        `encrypt failed: text exceeds max length`);
    }
    let encrypted: string = '';
    for (let i: number = 0; i < plainText.length; i++) {
      const charCode: number = plainText.charCodeAt(i);
      const keyChar: number = this.encryptionKey.charCodeAt(i % this.encryptionKey.length);
      const shifted: number = (charCode + keyChar) % 65536;
      encrypted += shifted.toString(16).padStart(4, '0');
    }
    this.encryptCount++;
    this.lastEncryptTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_encryption_encrypt'), [String(this.encryptionMode), encrypted],
      `encrypt(${this.encryptionMode}): ${encrypted}`);
  }

  decrypt(cipherHex: string): string {
    if (!this.keyGenerated) {
      return ResultText.of($r('app.string.result_encryption_decrypt_no_key'), 'decrypt failed: no encryption key');
    }
    if (this.encryptionMode === EncryptionMode.NONE) {
      return ResultText.of($r('app.string.result_encryption_decrypt_mode_none'),
        'decrypt failed: encryption mode is NONE');
    }
    if (cipherHex.length === 0 || cipherHex.length % 4 !== 0) {
      return ResultText.of($r('app.string.result_encryption_decrypt_invalid_format'),
        'decrypt failed: invalid ciphertext format');
    }
    let decrypted: string = '';
    const hexPairs: string[] = [];
    for (let i: number = 0; i < cipherHex.length; i += 4) {
      hexPairs.push(cipherHex.substring(i, i + 4));
    }
    for (let i: number = 0; i < hexPairs.length; i++) {
      const hexVal: number = parseInt(hexPairs[i], 16);
      const keyChar: number = this.encryptionKey.charCodeAt(i % this.encryptionKey.length);
      const original: number = (hexVal - keyChar + 65536) % 65536;
      decrypted += String.fromCharCode(original);
    }
    this.decryptCount++;
    this.lastDecryptTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_encryption_decrypt'), [String(this.encryptionMode), decrypted],
      `decrypt(${this.encryptionMode}): ${decrypted}`);
  }

  encryptSync(plainText: string): string {
    return this.encrypt(plainText);
  }

  decryptSync(cipherHex: string): string {
    return this.decrypt(cipherHex);
  }

  computeHash(data: string): string {
    return this.hashText(data, true);
  }

  verifyHash(data: string, expectedHash: string): string {
    const computed: string = this.hashText(data, false);
    const match: boolean = computed === expectedHash;
    return ResultText.ofArgs($r('app.string.result_encryption_verify_hash'), [match ? 'MATCH' : 'MISMATCH'],
      `verifyHash: ${match ? 'MATCH' : 'MISMATCH'}`);
  }

  setEncryptionMode(mode: EncryptionMode): string {
    if (!DataValidator.isValidEncryptionMode(mode)) {
      return ResultText.ofArgs($r('app.string.result_encryption_set_mode_invalid'), [String(mode)],
        `setEncryptionMode failed: invalid mode '${mode}'`);
    }
    this.encryptionMode = mode;
    return ResultText.ofArgs($r('app.string.result_encryption_set_mode'), [String(mode)],
      `setEncryptionMode: ${mode}`);
  }

  getEncryptionMode(): EncryptionMode {
    return this.encryptionMode;
  }

  setHashAlgorithm(algorithm: HashAlgorithm): string {
    if (!DataValidator.isValidHashAlgorithm(algorithm)) {
      return ResultText.ofArgs($r('app.string.result_encryption_set_hash_invalid'), [String(algorithm)],
        `setHashAlgorithm failed: invalid algorithm '${algorithm}'`);
    }
    this.hashAlgorithm = algorithm;
    return ResultText.ofArgs($r('app.string.result_encryption_set_hash'), [String(algorithm)],
      `setHashAlgorithm: ${algorithm}`);
  }

  getHashAlgorithm(): HashAlgorithm {
    return this.hashAlgorithm;
  }

  setAutoEncrypt(enabled: boolean): string {
    this.autoEncrypt = enabled;
    return ResultText.ofArgs($r('app.string.result_encryption_set_auto_encrypt'), [String(enabled)],
      `setAutoEncrypt: ${enabled}`);
  }

  isAutoEncrypt(): boolean {
    return this.autoEncrypt;
  }

  getEncryptionConfig(): string {
    return ResultText.ofArgs($r('app.string.result_encryption_config'),
      [String(this.encryptionMode), this.keyLength, this.ivLength, String(this.hashAlgorithm),
        String(this.autoEncrypt)],
      `EncryptionConfig: mode=${this.encryptionMode}, keyLen=${this.keyLength}, ` +
        `ivLen=${this.ivLength}, hash=${this.hashAlgorithm}, autoEncrypt=${this.autoEncrypt}`);
  }

  getStatistics(): string {
    return ResultText.ofArgs($r('app.string.result_encryption_statistics'),
      [String(this.encryptionMode), String(this.hashAlgorithm), String(this.keyGenerated), this.encryptCount,
        this.decryptCount, this.hashCount, String(this.autoEncrypt), this.createdAt],
      `Encryption Statistics: mode=${this.encryptionMode}, hash=${this.hashAlgorithm}, ` +
        `keyGenerated=${this.keyGenerated}, encrypts=${this.encryptCount}, decrypts=${this.decryptCount}, ` +
        `hashes=${this.hashCount}, autoEncrypt=${this.autoEncrypt}, createdAt=${this.createdAt}`);
  }

  resetStatistics(): string {
    this.encryptCount = 0;
    this.decryptCount = 0;
    this.hashCount = 0;
    this.lastEncryptTime = 0;
    this.lastDecryptTime = 0;
    return ResultText.of($r('app.string.result_encryption_statistics_reset'), 'Encryption statistics reset');
  }

  isInitialized(): boolean {
    return this.createdAt > 0;
  }

  isKeyGenerated(): boolean {
    return this.keyGenerated;
  }

  release(): void {
    this.encryptionMode = EncryptionMode.NONE;
    this.hashAlgorithm = HashAlgorithm.SHA_256;
    this.keyLength = DEFAULT_KEY_LENGTH;
    this.ivLength = DEFAULT_IV_LENGTH;
    this.autoEncrypt = false;
    this.encryptionKey = '';
    this.keyGenerated = false;
    this.encryptCount = 0;
    this.decryptCount = 0;
    this.hashCount = 0;
    this.createdAt = 0;
    this.lastEncryptTime = 0;
    this.lastDecryptTime = 0;
    Logger.info('DataEncryptionManager released');
  }

  /**
   * Builds the hash result text for the given data.
   *
   * Only a real hash computation increases the statistics counter, so that a
   * verification, which recomputes the same hash, does not inflate it.
   */
  private hashText(data: string, countStatistic: boolean): string {
    if (data.length === 0) {
      return ResultText.of($r('app.string.result_encryption_hash_empty'), 'computeHash failed: empty data');
    }
    let hash: number = 0;
    for (let i: number = 0; i < data.length; i++) {
      const char: number = data.charCodeAt(i);
      hash = ((hash << 5) - hash) + char;
      hash = hash & hash;
    }
    const absHash: number = Math.abs(hash);
    let hashStr: string = '';
    switch (this.hashAlgorithm) {
      case HashAlgorithm.SHA_256:
        hashStr = `sha256_${absHash.toString(16).padStart(8, '0')}`;
        break;
      case HashAlgorithm.SHA_512:
        hashStr = `sha512_${absHash.toString(16).padStart(16, '0')}`;
        break;
      case HashAlgorithm.SM3:
        hashStr = `sm3_${absHash.toString(16).padStart(8, '0')}`;
        break;
      default:
        hashStr = `unknown_${absHash.toString(16)}`;
    }
    if (countStatistic) {
      this.hashCount++;
    }
    return ResultText.ofArgs($r('app.string.result_encryption_hash'), [String(this.hashAlgorithm), hashStr],
      `computeHash(${this.hashAlgorithm}): ${hashStr}`);
  }
}
