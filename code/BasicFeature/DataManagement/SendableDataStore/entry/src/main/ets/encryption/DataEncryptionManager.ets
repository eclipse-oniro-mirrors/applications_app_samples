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
    return `Encryption manager initialized: mode=${mode}, algorithm=${algorithm}`;
  }

  configure(config: EncryptionConfig): string {
    if (!DataValidator.isValidEncryptionMode(config.mode)) {
      return 'configure failed: invalid encryption mode';
    }
    if (!DataValidator.isValidHashAlgorithm(config.hashAlgorithm)) {
      return 'configure failed: invalid hash algorithm';
    }
    if (config.keyLength < MIN_KEY_LENGTH || config.keyLength > MAX_KEY_LENGTH) {
      return `configure failed: keyLength ${config.keyLength} out of range`;
    }
    this.encryptionMode = config.mode;
    this.hashAlgorithm = config.hashAlgorithm;
    this.keyLength = config.keyLength;
    this.ivLength = config.ivLength;
    this.autoEncrypt = config.autoEncrypt;
    this.createdAt = Date.now();
    return `configure completed: mode=${config.mode}, keyLen=${config.keyLength}, auto=${config.autoEncrypt}`;
  }

  generateKey(): string {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    let key = '';
    const effectiveLength = Math.floor(this.keyLength / 8);
    const genLength = effectiveLength > 0 ? effectiveLength : 32;
    for (let i = 0; i < genLength && i < 128; i++) {
      const idx = Math.floor(Math.random() * chars.length);
      key += chars.charAt(idx);
    }
    this.encryptionKey = key;
    this.keyGenerated = true;
    return `generateKey completed: length=${key.length}, mode=${this.encryptionMode}`;
  }

  getKey(): string {
    if (!this.keyGenerated) {
      return 'getKey failed: no key generated';
    }
    return `Key: ${this.encryptionKey.substring(0, 8)}...${this.encryptionKey.substring(this.encryptionKey.length - 4)}`;
  }

  getKeyLength(): number {
    return this.keyLength;
  }

  setKey(key: string): string {
    if (key.length < MIN_KEY_LENGTH) {
      return `setKey failed: key too short (${key.length} < ${MIN_KEY_LENGTH})`;
    }
    this.encryptionKey = key;
    this.keyGenerated = true;
    return `setKey completed: length=${key.length}`;
  }

  encrypt(plainText: string): string {
    if (!this.keyGenerated) {
      return 'encrypt failed: no encryption key';
    }
    if (this.encryptionMode === EncryptionMode.NONE) {
      return 'encrypt failed: encryption mode is NONE';
    }
    if (plainText.length === 0) {
      return 'encrypt failed: empty plaintext';
    }
    if (plainText.length > DataStoreConstants.MAX_VALUE_LENGTH) {
      return `encrypt failed: text exceeds max length`;
    }
    let encrypted = '';
    for (let i = 0; i < plainText.length; i++) {
      const charCode = plainText.charCodeAt(i);
      const keyChar = this.encryptionKey.charCodeAt(i % this.encryptionKey.length);
      const shifted = (charCode + keyChar) % 65536;
      encrypted += shifted.toString(16).padStart(4, '0');
    }
    this.encryptCount++;
    this.lastEncryptTime = Date.now();
    return `encrypt(${this.encryptionMode}): ${encrypted}`;
  }

  decrypt(cipherHex: string): string {
    if (!this.keyGenerated) {
      return 'decrypt failed: no encryption key';
    }
    if (this.encryptionMode === EncryptionMode.NONE) {
      return 'decrypt failed: encryption mode is NONE';
    }
    if (cipherHex.length === 0 || cipherHex.length % 4 !== 0) {
      return 'decrypt failed: invalid ciphertext format';
    }
    let decrypted = '';
    const hexPairs: string[] = [];
    for (let i = 0; i < cipherHex.length; i += 4) {
      hexPairs.push(cipherHex.substring(i, i + 4));
    }
    for (let i = 0; i < hexPairs.length; i++) {
      const hexVal = parseInt(hexPairs[i], 16);
      const keyChar = this.encryptionKey.charCodeAt(i % this.encryptionKey.length);
      const original = (hexVal - keyChar + 65536) % 65536;
      decrypted += String.fromCharCode(original);
    }
    this.decryptCount++;
    this.lastDecryptTime = Date.now();
    return `decrypt(${this.encryptionMode}): ${decrypted}`;
  }

  encryptSync(plainText: string): string {
    return this.encrypt(plainText);
  }

  decryptSync(cipherHex: string): string {
    return this.decrypt(cipherHex);
  }

  computeHash(data: string): string {
    if (data.length === 0) {
      return 'computeHash failed: empty data';
    }
    let hash = 0;
    for (let i = 0; i < data.length; i++) {
      const char = data.charCodeAt(i);
      hash = ((hash << 5) - hash) + char;
      hash = hash & hash;
    }
    const absHash = Math.abs(hash);
    let hashStr = '';
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
    this.hashCount++;
    return `computeHash(${this.hashAlgorithm}): ${hashStr}`;
  }

  verifyHash(data: string, expectedHash: string): string {
    const computed = this.computeHash(data);
    const match = computed === expectedHash;
    return `verifyHash: ${match ? 'MATCH' : 'MISMATCH'}`;
  }

  setEncryptionMode(mode: EncryptionMode): string {
    if (!DataValidator.isValidEncryptionMode(mode)) {
      return `setEncryptionMode failed: invalid mode '${mode}'`;
    }
    this.encryptionMode = mode;
    return `setEncryptionMode: ${mode}`;
  }

  getEncryptionMode(): EncryptionMode {
    return this.encryptionMode;
  }

  setHashAlgorithm(algorithm: HashAlgorithm): string {
    if (!DataValidator.isValidHashAlgorithm(algorithm)) {
      return `setHashAlgorithm failed: invalid algorithm '${algorithm}'`;
    }
    this.hashAlgorithm = algorithm;
    return `setHashAlgorithm: ${algorithm}`;
  }

  getHashAlgorithm(): HashAlgorithm {
    return this.hashAlgorithm;
  }

  setAutoEncrypt(enabled: boolean): string {
    this.autoEncrypt = enabled;
    return `setAutoEncrypt: ${enabled}`;
  }

  isAutoEncrypt(): boolean {
    return this.autoEncrypt;
  }

  getEncryptionConfig(): string {
    return `EncryptionConfig: mode=${this.encryptionMode}, keyLen=${this.keyLength}, ` +
      `ivLen=${this.ivLength}, hash=${this.hashAlgorithm}, autoEncrypt=${this.autoEncrypt}`;
  }

  getStatistics(): string {
    return `Encryption Statistics: mode=${this.encryptionMode}, hash=${this.hashAlgorithm}, ` +
      `keyGenerated=${this.keyGenerated}, encrypts=${this.encryptCount}, decrypts=${this.decryptCount}, ` +
      `hashes=${this.hashCount}, autoEncrypt=${this.autoEncrypt}, createdAt=${this.createdAt}`;
  }

  resetStatistics(): string {
    this.encryptCount = 0;
    this.decryptCount = 0;
    this.hashCount = 0;
    this.lastEncryptTime = 0;
    this.lastDecryptTime = 0;
    return 'Encryption statistics reset';
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
}
