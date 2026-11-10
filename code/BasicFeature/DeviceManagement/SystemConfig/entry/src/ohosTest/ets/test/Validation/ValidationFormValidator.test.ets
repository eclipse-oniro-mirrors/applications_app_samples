import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { FormValidator } from 'library';
import type { FormValidationResult, FieldRule } from 'library';

const DOMAIN: number = 0xF820;
const TAG: string = '[Sample_SystemConfig]';

/**
 * FormValidator 表单验证工具测试套件。
 * 验证规则管理、字段验证、内置验证器等全部公开方法。
 */
export default function FormValidatorTest(): void {
  describe('FormValidatorTest', () => {

    // ========================================
    // 规则管理
    // ========================================

    /**
     * @tc.number SUB_VALIDATION_FORM_VALIDATOR_0100
     * @tc.name testValidationFormValidator0001
     * @tc.desc 正向: 添加规则后 getRuleCount 递增
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationFormValidator0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationFormValidator0001 begin');
      const validator: FormValidator = new FormValidator();
      expect(validator.getRuleCount()).assertEqual(0);
      const rule: FieldRule = { required: true, minLength: 3 };
      validator.addRule('username', rule);
      expect(validator.getRuleCount()).assertEqual(1);
      validator.addRule('email', { required: true });
      expect(validator.getRuleCount()).assertEqual(2);
    });

    /**
     * @tc.number SUB_VALIDATION_FORM_VALIDATOR_0200
     * @tc.name testValidationFormValidator0002
     * @tc.desc 正向: 移除规则后 getRuleCount 递减
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationFormValidator0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationFormValidator0002 begin');
      const validator: FormValidator = new FormValidator();
      validator.addRule('username', { required: true });
      validator.addRule('email', { required: true });
      expect(validator.getRuleCount()).assertEqual(2);
      validator.removeRule('username');
      expect(validator.getRuleCount()).assertEqual(1);
      validator.removeRule('nonexistent');
      expect(validator.getRuleCount()).assertEqual(1);
    });

    /**
     * @tc.number SUB_VALIDATION_FORM_VALIDATOR_0300
     * @tc.name testValidationFormValidator0003
     * @tc.desc 正向: clearRules 后规则数归零
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationFormValidator0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationFormValidator0003 begin');
      const validator: FormValidator = new FormValidator();
      validator.addRule('a', { required: true });
      validator.addRule('b', { required: false });
      validator.addRule('c', { required: true, minLength: 5 });
      expect(validator.getRuleCount()).assertEqual(3);
      validator.clearRules();
      expect(validator.getRuleCount()).assertEqual(0);
      const fields: Map<string, string> = new Map();
      fields.set('a', '');
      const result: FormValidationResult = validator.validate(fields);
      expect(result.isValid).assertTrue();
    });

    // ========================================
    // 字段验证 - 必填检查
    // ========================================

    /**
     * @tc.number SUB_VALIDATION_FORM_VALIDATOR_0400
     * @tc.name testValidationFormValidator0004
     * @tc.desc 正向: 必填字段为空时验证失败
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationFormValidator0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationFormValidator0004 begin');
      const validator: FormValidator = new FormValidator();
      validator.addRule('username', { required: true });
      const fields: Map<string, string> = new Map();
      fields.set('username', '');
      const result: FormValidationResult = validator.validate(fields);
      expect(result.isValid).assertFalse();
      expect(result.errors.size).assertEqual(1);
      expect(result.errors.get('username')?.length).assertLarger(0);
    });

    /**
     * @tc.number SUB_VALIDATION_FORM_VALIDATOR_0500
     * @tc.name testValidationFormValidator0005
     * @tc.desc 正向: 必填字段有值时验证通过
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationFormValidator0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationFormValidator0005 begin');
      const validator: FormValidator = new FormValidator();
      validator.addRule('username', { required: true });
      const fields: Map<string, string> = new Map();
      fields.set('username', 'testUser');
      const result: FormValidationResult = validator.validate(fields);
      expect(result.isValid).assertTrue();
      expect(result.errors.size).assertEqual(0);
      const fieldResult = validator.validateField('username', 'testUser');
      expect(fieldResult.valid).assertTrue();
    });

    // ========================================
    // 字段验证 - 长度限制
    // ========================================

    /**
     * @tc.number SUB_VALIDATION_FORM_VALIDATOR_0600
     * @tc.name testValidationFormValidator0006
     * @tc.desc 正向: 字段长度小于 minLength 时验证失败
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testValidationFormValidator0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationFormValidator0006 begin');
      const validator: FormValidator = new FormValidator();
      validator.addRule('password', { required: true, minLength: 8 });
      const fields: Map<string, string> = new Map();
      fields.set('password', 'abc');
      const result: FormValidationResult = validator.validate(fields);
      expect(result.isValid).assertFalse();
      expect(result.errors.has('password')).assertTrue();
      const fieldResult = validator.validateField('password', 'abc');
      expect(fieldResult.valid).assertFalse();
    });

    /**
     * @tc.number SUB_VALIDATION_FORM_VALIDATOR_0700
     * @tc.name testValidationFormValidator0007
     * @tc.desc 正向: 字段长度超过 maxLength 时验证失败
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testValidationFormValidator0007', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationFormValidator0007 begin');
      const validator: FormValidator = new FormValidator();
      validator.addRule('name', { required: false, maxLength: 5 });
      const fields: Map<string, string> = new Map();
      fields.set('name', 'abcdefghij');
      const result: FormValidationResult = validator.validate(fields);
      expect(result.isValid).assertFalse();
      expect(result.errors.has('name')).assertTrue();
      const passResult = validator.validateField('name', 'abc');
      expect(passResult.valid).assertTrue();
    });

    // ========================================
    // 字段验证 - 正则模式
    // ========================================

    /**
     * @tc.number SUB_VALIDATION_FORM_VALIDATOR_0800
     * @tc.name testValidationFormValidator0008
     * @tc.desc 正向: 不匹配正则时验证失败
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testValidationFormValidator0008', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationFormValidator0008 begin');
      const validator: FormValidator = new FormValidator();
      validator.addRule('code', { required: false, pattern: /^\d{6}$/ });
      const failResult = validator.validateField('code', 'abc');
      expect(failResult.valid).assertFalse();
      expect(failResult.error).assertEqual('code 格式不正确');
      const passResult = validator.validateField('code', '123456');
      expect(passResult.valid).assertTrue();
      expect(passResult.error).assertNull();
    });

    // ========================================
    // 字段验证 - 自定义验证器
    // ========================================

    /**
     * @tc.number SUB_VALIDATION_FORM_VALIDATOR_0900
     * @tc.name testValidationFormValidator0009
     * @tc.desc 正向: 自定义验证器返回错误时验证失败
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testValidationFormValidator0009', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationFormValidator0009 begin');
      const validator: FormValidator = new FormValidator();
      const customFn = (value: string): string | null => {
        if (value.indexOf('admin') >= 0) {
          return '不允许包含 admin';
        }
        return null;
      };
      validator.addRule('username', { required: false, customValidator: customFn });
      const failResult = validator.validateField('username', 'adminUser');
      expect(failResult.valid).assertFalse();
      expect(failResult.error).assertEqual('不允许包含 admin');
      const passResult = validator.validateField('username', 'testUser');
      expect(passResult.valid).assertTrue();
      expect(passResult.error).assertNull();
    });

    // ========================================
    // 无规则字段验证
    // ========================================

    /**
     * @tc.number SUB_VALIDATION_FORM_VALIDATOR_1000
     * @tc.name testValidationFormValidator0010
     * @tc.desc 正向: 未注册规则的字段验证直接通过
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationFormValidator0010', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationFormValidator0010 begin');
      const validator: FormValidator = new FormValidator();
      const result = validator.validateField('unknown', 'anything');
      expect(result.valid).assertTrue();
      expect(result.error).assertNull();
      const fields: Map<string, string> = new Map();
      fields.set('unknown', '');
      const formResult: FormValidationResult = validator.validate(fields);
      expect(formResult.isValid).assertTrue();
      expect(formResult.errors.size).assertEqual(0);
    });

    // ========================================
    // 内置静态验证器
    // ========================================

    /**
     * @tc.number SUB_VALIDATION_FORM_VALIDATOR_1100
     * @tc.name testValidationFormValidator0011
     * @tc.desc 正向: isEmail 验证合法/非法邮箱
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationFormValidator0011', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationFormValidator0011 begin');
      expect(FormValidator.isEmail('test@example.com')).assertTrue();
      expect(FormValidator.isEmail('user.name+tag@domain.co')).assertTrue();
      expect(FormValidator.isEmail('invalid-email')).assertFalse();
      expect(FormValidator.isEmail('@no-local.com')).assertFalse();
      expect(FormValidator.isEmail('')).assertFalse();
    });

    /**
     * @tc.number SUB_VALIDATION_FORM_VALIDATOR_1200
     * @tc.name testValidationFormValidator0012
     * @tc.desc 正向: isPhone 验证合法/非法手机号
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationFormValidator0012', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationFormValidator0012 begin');
      expect(FormValidator.isPhone('13800138000')).assertTrue();
      expect(FormValidator.isPhone('15912345678')).assertTrue();
      expect(FormValidator.isPhone('12345678901')).assertFalse();
      expect(FormValidator.isPhone('1380013800')).assertFalse();
      expect(FormValidator.isPhone('')).assertFalse();
    });

    /**
     * @tc.number SUB_VALIDATION_FORM_VALIDATOR_1300
     * @tc.name testValidationFormValidator0013
     * @tc.desc 正向: isUrl 验证合法/非法 URL
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationFormValidator0013', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationFormValidator0013 begin');
      expect(FormValidator.isUrl('https://www.example.com')).assertTrue();
      expect(FormValidator.isUrl('http://localhost:8080/path')).assertTrue();
      expect(FormValidator.isUrl('ftp://files.example.com')).assertTrue();
      expect(FormValidator.isUrl('not-a-url')).assertFalse();
      expect(FormValidator.isUrl('')).assertFalse();
    });

    /**
     * @tc.number SUB_VALIDATION_FORM_VALIDATOR_1400
     * @tc.name testValidationFormValidator0014
     * @tc.desc 正向: isNotEmpty 验证非空
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationFormValidator0014', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationFormValidator0014 begin');
      expect(FormValidator.isNotEmpty('hello')).assertTrue();
      expect(FormValidator.isNotEmpty('  a  ')).assertTrue();
      expect(FormValidator.isNotEmpty('')).assertFalse();
      expect(FormValidator.isNotEmpty('   ')).assertFalse();
    });

    /**
     * @tc.number SUB_VALIDATION_FORM_VALIDATOR_1500
     * @tc.name testValidationFormValidator0015
     * @tc.desc 正向: matchesPattern 验证正则匹配
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testValidationFormValidator0015', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationFormValidator0015 begin');
      const pattern: RegExp = /^[A-Z]{3}$/;
      expect(FormValidator.matchesPattern('ABC', pattern)).assertTrue();
      expect(FormValidator.matchesPattern('abc', pattern)).assertFalse();
      expect(FormValidator.matchesPattern('ABCD', pattern)).assertFalse();
    });

    // ========================================
    // 多字段综合验证
    // ========================================

    /**
     * @tc.number SUB_VALIDATION_FORM_VALIDATOR_1600
     * @tc.name testValidationFormValidator0016
     * @tc.desc 正向: 多字段综合验证，部分失败
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testValidationFormValidator0016', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationFormValidator0016 begin');
      const validator: FormValidator = new FormValidator();
      validator.addRule('username', { required: true, minLength: 3 });
      validator.addRule('email', { required: true });
      validator.addRule('age', { required: false });
      const fields: Map<string, string> = new Map();
      fields.set('username', 'ab');
      fields.set('email', '');
      fields.set('age', '25');
      const result: FormValidationResult = validator.validate(fields);
      expect(result.isValid).assertFalse();
      expect(result.errors.size).assertEqual(2);
      expect(result.errors.has('username')).assertTrue();
      expect(result.errors.has('email')).assertTrue();
    });

    // ========================================
    // 边界值：纯空格必填
    // ========================================

    /**
     * @tc.number SUB_VALIDATION_FORM_VALIDATOR_1700
     * @tc.name testValidationFormValidator0017
     * @tc.desc 边界: 纯空格作为必填字段时验证失败（trim 后为空）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testValidationFormValidator0017', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationFormValidator0017 begin');
      const validator: FormValidator = new FormValidator();
      validator.addRule('name', { required: true });
      const fields: Map<string, string> = new Map();
      fields.set('name', '   ');
      const result: FormValidationResult = validator.validate(fields);
      expect(result.isValid).assertFalse();
      expect(result.errors.has('name')).assertTrue();
      const fieldResult = validator.validateField('name', '   ');
      expect(fieldResult.valid).assertFalse();
    });
  });
}
