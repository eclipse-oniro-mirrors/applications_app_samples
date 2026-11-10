import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { PreferenceUtils } from 'library';
import type { PreferenceChangeListener } from 'library';

const DOMAIN: number = 0xF820;
const TAG: string = '[Sample_SystemConfig]';

/**
 * PreferenceUtils 偏好设置工具类测试套件。
 * 覆盖构造/get/getWithDefault/set/remove/clear/has/keys/getAll/size/
 * getStoreName/监听器管理/destroy 等全部公开方法。
 */
export default function PreferenceUtilsTest(): void {
  describe('PreferenceUtilsTest', () => {

    // ========================================
    // 构造与基础存取
    // ========================================

    /**
     * @tc.number SUB_DEVICE_PREFERENCE_UTILS_0100
     * @tc.name testDevicePreferenceUtils0001
     * @tc.desc 正向: 构造后 getStoreName 返回正确名称
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDevicePreferenceUtils0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDevicePreferenceUtils0001 begin');
      const prefs: PreferenceUtils = new PreferenceUtils('testStore');
      expect(prefs.getStoreName()).assertEqual('testStore');
      expect(prefs.size()).assertEqual(0);
      expect(prefs.keys().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DEVICE_PREFERENCE_UTILS_0200
     * @tc.name testDevicePreferenceUtils0002
     * @tc.desc 正向: set 后 get 返回正确值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDevicePreferenceUtils0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDevicePreferenceUtils0002 begin');
      const prefs: PreferenceUtils = new PreferenceUtils('testStore');
      prefs.set('key1', 'value1');
      expect(prefs.get('key1')).assertEqual('value1');
      expect(prefs.has('key1')).assertTrue();
      expect(prefs.size()).assertEqual(1);
      prefs.set('key2', 'value2');
      expect(prefs.size()).assertEqual(2);
      expect(prefs.get('key2')).assertEqual('value2');
    });

    /**
     * @tc.number SUB_DEVICE_PREFERENCE_UTILS_0300
     * @tc.name testDevicePreferenceUtils0003
     * @tc.desc 边界: 获取不存在的键返回 null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDevicePreferenceUtils0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDevicePreferenceUtils0003 begin');
      const prefs: PreferenceUtils = new PreferenceUtils('testStore');
      expect(prefs.get('nonexistent')).assertNull();
      expect(prefs.has('nonexistent')).assertFalse();
      expect(prefs.size()).assertEqual(0);
    });

    // ========================================
    // getWithDefault
    // ========================================

    /**
     * @tc.number SUB_DEVICE_PREFERENCE_UTILS_0400
     * @tc.name testDevicePreferenceUtils0004
     * @tc.desc 正向: 键存在返回值，不存在返回默认值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDevicePreferenceUtils0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDevicePreferenceUtils0004 begin');
      const prefs: PreferenceUtils = new PreferenceUtils('testStore');
      prefs.set('existing', 'realValue');
      expect(prefs.getWithDefault('existing', 'default')).assertEqual('realValue');
      expect(prefs.getWithDefault('missing', 'default')).assertEqual('default');
      expect(prefs.getWithDefault('', 'fallback')).assertEqual('fallback');
    });

    // ========================================
    // remove
    // ========================================

    /**
     * @tc.number SUB_DEVICE_PREFERENCE_UTILS_0500
     * @tc.name testDevicePreferenceUtils0005
     * @tc.desc 正向: remove 后键不存在
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDevicePreferenceUtils0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDevicePreferenceUtils0005 begin');
      const prefs: PreferenceUtils = new PreferenceUtils('testStore');
      prefs.set('key1', 'value1');
      prefs.set('key2', 'value2');
      expect(prefs.size()).assertEqual(2);
      prefs.remove('key1');
      expect(prefs.has('key1')).assertFalse();
      expect(prefs.size()).assertEqual(1);
      prefs.remove('nonexistent');
      expect(prefs.size()).assertEqual(1);
    });

    // ========================================
    // clear
    // ========================================

    /**
     * @tc.number SUB_DEVICE_PREFERENCE_UTILS_0600
     * @tc.name testDevicePreferenceUtils0006
     * @tc.desc 正向: clear 后所有数据清空
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDevicePreferenceUtils0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDevicePreferenceUtils0006 begin');
      const prefs: PreferenceUtils = new PreferenceUtils('testStore');
      prefs.set('a', '1');
      prefs.set('b', '2');
      prefs.set('c', '3');
      expect(prefs.size()).assertEqual(3);
      prefs.clear();
      expect(prefs.size()).assertEqual(0);
      expect(prefs.has('a')).assertFalse();
      expect(prefs.keys().length).assertEqual(0);
    });

    // ========================================
    // keys / getAll
    // ========================================

    /**
     * @tc.number SUB_DEVICE_PREFERENCE_UTILS_0700
     * @tc.name testDevicePreferenceUtils0007
     * @tc.desc 正向: keys 返回所有键，getAll 返回副本
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDevicePreferenceUtils0007', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDevicePreferenceUtils0007 begin');
      const prefs: PreferenceUtils = new PreferenceUtils('testStore');
      prefs.set('x', '10');
      prefs.set('y', '20');
      const keys: string[] = prefs.keys();
      expect(keys.length).assertEqual(2);
      expect(keys.indexOf('x')).assertLarger(-1);
      expect(keys.indexOf('y')).assertLarger(-1);
      const all: Map<string, string> = prefs.getAll();
      expect(all.size).assertEqual(2);
      expect(all.get('x')).assertEqual('10');
      expect(all.get('y')).assertEqual('20');
    });

    // ========================================
    // 覆盖写入
    // ========================================

    /**
     * @tc.number SUB_DEVICE_PREFERENCE_UTILS_0800
     * @tc.name testDevicePreferenceUtils0008
     * @tc.desc 正向: 重复 set 同一键覆盖旧值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDevicePreferenceUtils0008', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDevicePreferenceUtils0008 begin');
      const prefs: PreferenceUtils = new PreferenceUtils('testStore');
      prefs.set('key', 'old');
      expect(prefs.get('key')).assertEqual('old');
      prefs.set('key', 'new');
      expect(prefs.get('key')).assertEqual('new');
      expect(prefs.size()).assertEqual(1);
    });

    // ========================================
    // 监听器管理
    // ========================================

    /**
     * @tc.number SUB_DEVICE_PREFERENCE_UTILS_0900
     * @tc.name testDevicePreferenceUtils0009
     * @tc.desc 正向: set/remove 触发 onChanged 回调
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDevicePreferenceUtils0009', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDevicePreferenceUtils0009 begin');
      const prefs: PreferenceUtils = new PreferenceUtils('testStore');
      let lastKey: string = '';
      let lastOld: string | null = null;
      let lastNew: string | null = null;
      const listener: PreferenceChangeListener = {
        onChanged(key: string, oldValue: string | null, newValue: string | null): void {
          lastKey = key;
          lastOld = oldValue;
          lastNew = newValue;
        },
        onCleared(): void {}
      };
      prefs.addListener(listener);
      prefs.set('name', 'Alice');
      expect(lastKey).assertEqual('name');
      expect(lastOld).assertNull();
      expect(lastNew).assertEqual('Alice');
      prefs.set('name', 'Bob');
      expect(lastOld).assertEqual('Alice');
      expect(lastNew).assertEqual('Bob');
      prefs.remove('name');
      expect(lastOld).assertEqual('Bob');
      expect(lastNew).assertNull();
    });

    /**
     * @tc.number SUB_DEVICE_PREFERENCE_UTILS_1000
     * @tc.name testDevicePreferenceUtils0010
     * @tc.desc 正向: clear 触发 onCleared 回调
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDevicePreferenceUtils0010', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDevicePreferenceUtils0010 begin');
      const prefs: PreferenceUtils = new PreferenceUtils('testStore');
      let cleared: boolean = false;
      const listener: PreferenceChangeListener = {
        onChanged(_key: string, _old: string | null, _new: string | null): void {},
        onCleared(): void {
          cleared = true;
        }
      };
      prefs.addListener(listener);
      prefs.set('a', '1');
      expect(cleared).assertFalse();
      expect(prefs.size()).assertEqual(1);
      prefs.clear();
      expect(cleared).assertTrue();
      expect(prefs.size()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DEVICE_PREFERENCE_UTILS_1100
     * @tc.name testDevicePreferenceUtils0011
     * @tc.desc 正向: 移除监听器后不再收到回调
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDevicePreferenceUtils0011', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDevicePreferenceUtils0011 begin');
      const prefs: PreferenceUtils = new PreferenceUtils('testStore');
      let callCount: number = 0;
      const listener: PreferenceChangeListener = {
        onChanged(_key: string, _old: string | null, _new: string | null): void {
          callCount++;
        },
        onCleared(): void {}
      };
      prefs.addListener(listener);
      prefs.set('a', '1');
      expect(callCount).assertEqual(1);
      prefs.removeListener(listener);
      prefs.set('b', '2');
      expect(callCount).assertEqual(1);
      expect(prefs.size()).assertEqual(2);
      prefs.removeListener(listener);
    });

    /**
     * @tc.number SUB_DEVICE_PREFERENCE_UTILS_1200
     * @tc.name testDevicePreferenceUtils0012
     * @tc.desc 边界: 重复添加同一监听器只注册一次
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDevicePreferenceUtils0012', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDevicePreferenceUtils0012 begin');
      const prefs: PreferenceUtils = new PreferenceUtils('testStore');
      let callCount: number = 0;
      const listener: PreferenceChangeListener = {
        onChanged(_key: string, _old: string | null, _new: string | null): void {
          callCount++;
        },
        onCleared(): void {}
      };
      prefs.addListener(listener);
      prefs.addListener(listener);
      prefs.set('a', '1');
      expect(callCount).assertEqual(1);
      expect(prefs.size()).assertEqual(1);
      prefs.removeListener(listener);
      prefs.set('b', '2');
      expect(callCount).assertEqual(1);
    });

    // ========================================
    // destroy
    // ========================================

    /**
     * @tc.number SUB_DEVICE_PREFERENCE_UTILS_1300
     * @tc.name testDevicePreferenceUtils0013
     * @tc.desc 正向: destroy 后数据清空、get 返回 null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDevicePreferenceUtils0013', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDevicePreferenceUtils0013 begin');
      const prefs: PreferenceUtils = new PreferenceUtils('testStore');
      prefs.set('key', 'value');
      expect(prefs.get('key')).assertEqual('value');
      prefs.destroy();
      expect(prefs.size()).assertEqual(0);
      expect(prefs.get('key')).assertNull();
      expect(prefs.has('key')).assertFalse();
    });
  });
}
