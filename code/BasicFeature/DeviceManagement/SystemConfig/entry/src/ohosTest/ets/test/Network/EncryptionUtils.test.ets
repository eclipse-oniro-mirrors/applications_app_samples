import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { EncryptionUtils } from 'library';

const DOMAIN: number = 0xF820;
const TAG: string = '[Sample_SystemConfig]';

/**
 * EncryptionUtils 工具类测试套件。
 */
export default function EncryptionUtilsTest(): void {
  describe('EncryptionUtilsTest', () => {

    /**
     * @tc.number SUB_ENCRYPTION_UTILS_0100
     * @tc.name testEncryptionUtils0001
     * @tc.desc 正向: Base64 编码后解码还原
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEncryptionUtils0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEncryptionUtils0001: begin');
      const original: string = 'Hello OpenHarmony';
      const encoded: string = EncryptionUtils.base64Encode(original);
      expect(encoded.length).assertLarger(0);
      expect(encoded === original).assertFalse();
      const decoded: string = EncryptionUtils.base64Decode(encoded);
      expect(decoded).assertEqual(original);
    });

    /**
     * @tc.number SUB_ENCRYPTION_UTILS_0200
     * @tc.name testEncryptionUtils0002
     * @tc.desc 正向: 空字符串编解码
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEncryptionUtils0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEncryptionUtils0002: begin');
      const encoded: string = EncryptionUtils.base64Encode('');
      expect(encoded.length).assertEqual(0);
      const decoded: string = EncryptionUtils.base64Decode(encoded);
      expect(decoded).assertEqual('');
      expect(decoded).assertEqual('');
    });

    /**
     * @tc.number SUB_ENCRYPTION_UTILS_0300
     * @tc.name testEncryptionUtils0003
     * @tc.desc 正向: MD5 哈希返回 32 位十六进制
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEncryptionUtils0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEncryptionUtils0003: begin');
      const hash: string = EncryptionUtils.md5Hash('test');
      expect(hash.length).assertEqual(32);
      expect(hash.indexOf('0x')).assertEqual(-1);
      expect(/^[0-9a-f]+$/.test(hash)).assertTrue();
    });

    /**
     * @tc.number SUB_ENCRYPTION_UTILS_0400
     * @tc.name testEncryptionUtils0004
     * @tc.desc 正向: 相同输入 MD5 一致
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEncryptionUtils0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEncryptionUtils0004: begin');
      const hash1: string = EncryptionUtils.md5Hash('hello');
      const hash2: string = EncryptionUtils.md5Hash('hello');
      expect(hash1).assertEqual(hash2);
      expect(hash1.length).assertEqual(32);
      expect(hash2.length).assertEqual(32);
    });

    /**
     * @tc.number SUB_ENCRYPTION_UTILS_0500
     * @tc.name testEncryptionUtils0005
     * @tc.desc 正向: SHA-256 哈希返回 64 位十六进制
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEncryptionUtils0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEncryptionUtils0005: begin');
      const hash: string = EncryptionUtils.sha256Hash('test');
      expect(hash.length).assertEqual(64);
      expect(/^[0-9a-f]+$/.test(hash)).assertTrue();
      const hash2: string = EncryptionUtils.sha256Hash('test');
      expect(hash2).assertEqual(hash);
    });

    /**
     * @tc.number SUB_ENCRYPTION_UTILS_0600
     * @tc.name testEncryptionUtils0006
     * @tc.desc 正向: 凯撒加密后解密还原
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEncryptionUtils0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEncryptionUtils0006: begin');
      const original: string = 'HelloWorld';
      const encrypted: string = EncryptionUtils.encryptCaesar(original, 3);
      expect(encrypted === original).assertFalse();
      expect(encrypted.length).assertEqual(original.length);
      const decrypted: string = EncryptionUtils.decryptCaesar(encrypted, 3);
      expect(decrypted).assertEqual(original);
    });

    /**
     * @tc.number SUB_ENCRYPTION_UTILS_0700
     * @tc.name testEncryptionUtils0007
     * @tc.desc 正向: 生成指定长度 Nonce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEncryptionUtils0007', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEncryptionUtils0007: begin');
      const nonce: string = EncryptionUtils.generateNonce(16);
      expect(nonce.length).assertEqual(16);
      const nonce2: string = EncryptionUtils.generateNonce(16);
      expect(nonce === nonce2).assertFalse();
      expect(nonce2.length).assertEqual(16);
    });

    /**
     * @tc.number SUB_ENCRYPTION_UTILS_0800
     * @tc.name testEncryptionUtils0008
     * @tc.desc 正向: 生成 64 位 Token
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEncryptionUtils0008', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEncryptionUtils0008: begin');
      const token: string = EncryptionUtils.generateToken();
      expect(token.length).assertEqual(64);
      expect(/^[0-9a-f]+$/.test(token)).assertTrue();
      const token2: string = EncryptionUtils.generateToken();
      expect(token === token2).assertFalse();
    });

    /**
     * @tc.number SUB_ENCRYPTION_UTILS_0900
     * @tc.name testEncryptionUtils0009
     * @tc.desc 正向: 十六进制转字节再转回
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEncryptionUtils0009', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEncryptionUtils0009: begin');
      const hex: string = '48656c6c6f';
      const bytes: number[] = EncryptionUtils.hexToBytes(hex);
      expect(bytes.length).assertLarger(0);
      expect(bytes.length).assertEqual(5);
      const result: string = EncryptionUtils.bytesToHex(bytes);
      expect(result).assertEqual(hex);
    });

    /**
     * @tc.number SUB_ENCRYPTION_UTILS_1000
     * @tc.name testEncryptionUtils0010
     * @tc.desc 正向: 不同输入产生不同 MD5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEncryptionUtils0010', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEncryptionUtils0010: begin');
      const hash1: string = EncryptionUtils.md5Hash('input1');
      const hash2: string = EncryptionUtils.md5Hash('input2');
      expect(hash1 === hash2).assertFalse();
      expect(hash1.length).assertEqual(32);
      expect(hash2.length).assertEqual(32);
    });
  });
}
