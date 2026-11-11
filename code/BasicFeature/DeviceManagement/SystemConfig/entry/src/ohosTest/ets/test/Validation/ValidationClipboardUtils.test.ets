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
import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { ClipboardUtils, ClipboardDataType } from 'library';
import type { ClipboardChangeListener } from 'library';

const DOMAIN: number = 0xF820;
const TAG: string = '[Sample_SystemConfig]';

/**
 * ClipboardUtils 剪贴板工具类测试套件。
 * 覆盖 setData/getData/getDataType/hasData/clear、
 * 监听器管理、类型检测、parseClipboardContent、操作历史等全部公开方法。
 */
export default function ClipboardUtilsTest(): void {
  describe('ClipboardUtilsTest', () => {

    // ========================================
    // 基础数据存取
    // ========================================

    /**
     * @tc.number SUB_VALIDATION_CLIPBOARD_UTILS_0100
     * @tc.name testValidationClipboardUtils0001
     * @tc.desc 正向: setData 后 getData 返回写入的数据
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationClipboardUtils0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationClipboardUtils0001 begin');
      const clip: ClipboardUtils = new ClipboardUtils();
      clip.setData('hello world');
      expect(clip.getData()).assertEqual('hello world');
      expect(clip.hasData()).assertTrue();
      expect(clip.getDataType()).assertEqual(ClipboardDataType.TEXT);
    });

    /**
     * @tc.number SUB_VALIDATION_CLIPBOARD_UTILS_0200
     * @tc.name testValidationClipboardUtils0002
     * @tc.desc 正向: clear 后数据清空且 hasData 返回 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationClipboardUtils0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationClipboardUtils0002 begin');
      const clip: ClipboardUtils = new ClipboardUtils();
      clip.setData('some data');
      expect(clip.hasData()).assertTrue();
      clip.clear();
      expect(clip.hasData()).assertFalse();
      expect(clip.getData()).assertEqual('');
      expect(clip.getDataType()).assertEqual(ClipboardDataType.UNKNOWN);
    });

    /**
     * @tc.number SUB_VALIDATION_CLIPBOARD_UTILS_0300
     * @tc.name testValidationClipboardUtils0003
     * @tc.desc 正向: 多次 setData 后者覆盖前者
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationClipboardUtils0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationClipboardUtils0003 begin');
      const clip: ClipboardUtils = new ClipboardUtils();
      clip.setData('first');
      expect(clip.getData()).assertEqual('first');
      clip.setData('second');
      expect(clip.getData()).assertEqual('second');
      expect(clip.hasData()).assertTrue();
    });

    // ========================================
    // 自动类型检测
    // ========================================

    /**
     * @tc.number SUB_VALIDATION_CLIPBOARD_UTILS_0400
     * @tc.name testValidationClipboardUtils0004
     * @tc.desc 正向: 写入 URL 自动识别为 URL 类型
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationClipboardUtils0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationClipboardUtils0004 begin');
      const clip: ClipboardUtils = new ClipboardUtils();
      clip.setData('https://www.example.com/path?q=1');
      expect(clip.getDataType()).assertEqual(ClipboardDataType.URL);
      expect(clip.getData()).assertEqual('https://www.example.com/path?q=1');
      expect(clip.hasData()).assertTrue();
    });

    /**
     * @tc.number SUB_VALIDATION_CLIPBOARD_UTILS_0500
     * @tc.name testValidationClipboardUtils0005
     * @tc.desc 正向: 写入 HTML 内容自动识别为 HTML 类型
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testValidationClipboardUtils0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationClipboardUtils0005 begin');
      const clip: ClipboardUtils = new ClipboardUtils();
      clip.setData('<div class="test">Hello</div>');
      expect(clip.getDataType()).assertEqual(ClipboardDataType.HTML);
      expect(clip.hasData()).assertTrue();
      expect(clip.getData().length).assertLarger(0);
    });

    /**
     * @tc.number SUB_VALIDATION_CLIPBOARD_UTILS_0600
     * @tc.name testValidationClipboardUtils0006
     * @tc.desc 正向: 写入 image:// 前缀自动识别为 IMAGE 类型
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testValidationClipboardUtils0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationClipboardUtils0006 begin');
      const clip: ClipboardUtils = new ClipboardUtils();
      clip.setData('image://photo/123');
      expect(clip.getDataType()).assertEqual(ClipboardDataType.IMAGE);
      clip.setData('data:image/png;base64,abc');
      expect(clip.getDataType()).assertEqual(ClipboardDataType.IMAGE);
      expect(clip.hasData()).assertTrue();
    });

    /**
     * @tc.number SUB_VALIDATION_CLIPBOARD_UTILS_0700
     * @tc.name testValidationClipboardUtils0007
     * @tc.desc 边界: 空字符串数据类型为 UNKNOWN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationClipboardUtils0007', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationClipboardUtils0007 begin');
      const clip: ClipboardUtils = new ClipboardUtils();
      clip.setData('');
      expect(clip.getDataType()).assertEqual(ClipboardDataType.UNKNOWN);
      expect(clip.hasData()).assertFalse();
      expect(clip.getData()).assertEqual('');
    });

    // ========================================
    // 监听器管理
    // ========================================

    /**
     * @tc.number SUB_VALIDATION_CLIPBOARD_UTILS_0800
     * @tc.name testValidationClipboardUtils0008
     * @tc.desc 正向: 添加监听器后 getListenerCount 递增
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationClipboardUtils0008', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationClipboardUtils0008 begin');
      const clip: ClipboardUtils = new ClipboardUtils();
      expect(clip.getListenerCount()).assertEqual(0);
      const listener: ClipboardChangeListener = {
        onClip(_type: ClipboardDataType, _data: string): void {}
      };
      clip.addListener(listener);
      expect(clip.getListenerCount()).assertEqual(1);
      clip.addListener({ onClip(): void {} });
      expect(clip.getListenerCount()).assertEqual(2);
    });

    /**
     * @tc.number SUB_VALIDATION_CLIPBOARD_UTILS_0900
     * @tc.name testValidationClipboardUtils0009
     * @tc.desc 正向: 移除监听器后 getListenerCount 递减
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationClipboardUtils0009', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationClipboardUtils0009 begin');
      const clip: ClipboardUtils = new ClipboardUtils();
      const listener: ClipboardChangeListener = {
        onClip(_type: ClipboardDataType, _data: string): void {}
      };
      clip.addListener(listener);
      expect(clip.getListenerCount()).assertEqual(1);
      clip.removeListener(listener);
      expect(clip.getListenerCount()).assertEqual(0);
      clip.removeListener(listener);
      expect(clip.getListenerCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_VALIDATION_CLIPBOARD_UTILS_1000
     * @tc.name testValidationClipboardUtils0010
     * @tc.desc 正向: setData 时监听器收到正确回调
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationClipboardUtils0010', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationClipboardUtils0010 begin');
      const clip: ClipboardUtils = new ClipboardUtils();
      let receivedType: ClipboardDataType = ClipboardDataType.UNKNOWN;
      let receivedData: string = '';
      const listener: ClipboardChangeListener = {
        onClip(type: ClipboardDataType, data: string): void {
          receivedType = type;
          receivedData = data;
        }
      };
      clip.addListener(listener);
      clip.setData('https://example.com');
      expect(receivedType).assertEqual(ClipboardDataType.URL);
      expect(receivedData).assertEqual('https://example.com');
      expect(receivedData.length).assertLarger(0);
    });

    // ========================================
    // 类型标签与判断方法
    // ========================================

    /**
     * @tc.number SUB_VALIDATION_CLIPBOARD_UTILS_1100
     * @tc.name testValidationClipboardUtils0011
     * @tc.desc 正向: 各枚举值对应正确的中文标签
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationClipboardUtils0011', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationClipboardUtils0011 begin');
      const clip: ClipboardUtils = new ClipboardUtils();
      expect(clip.getDataTypeLabel(ClipboardDataType.TEXT)).assertEqual('纯文本');
      expect(clip.getDataTypeLabel(ClipboardDataType.URL)).assertEqual('网址链接');
      expect(clip.getDataTypeLabel(ClipboardDataType.IMAGE)).assertEqual('图片资源');
      expect(clip.getDataTypeLabel(ClipboardDataType.HTML)).assertEqual('HTML富文本');
      expect(clip.getDataTypeLabel(ClipboardDataType.UNKNOWN)).assertEqual('未知类型');
    });

    /**
     * @tc.number SUB_VALIDATION_CLIPBOARD_UTILS_1200
     * @tc.name testValidationClipboardUtils0012
     * @tc.desc 正向: isUrl 识别合法/非法 URL
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationClipboardUtils0012', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationClipboardUtils0012 begin');
      const clip: ClipboardUtils = new ClipboardUtils();
      expect(clip.isUrl('https://www.example.com')).assertTrue();
      expect(clip.isUrl('http://localhost:8080/path')).assertTrue();
      expect(clip.isUrl('ftp://files.example.com')).assertTrue();
      expect(clip.isUrl('not a url')).assertFalse();
      expect(clip.isUrl('')).assertFalse();
      expect(clip.isUrl('example.com')).assertFalse();
    });

    /**
     * @tc.number SUB_VALIDATION_CLIPBOARD_UTILS_1300
     * @tc.name testValidationClipboardUtils0013
     * @tc.desc 正向: isHtml 识别包含 HTML 标签的字符串
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationClipboardUtils0013', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationClipboardUtils0013 begin');
      const clip: ClipboardUtils = new ClipboardUtils();
      expect(clip.isHtml('<p>Hello</p>')).assertTrue();
      expect(clip.isHtml('<div class="test">content</div>')).assertTrue();
      expect(clip.isHtml('<br/>')).assertTrue();
      expect(clip.isHtml('plain text')).assertFalse();
      expect(clip.isHtml('')).assertFalse();
      expect(clip.isHtml('1 < 2 > 0')).assertFalse();
    });

    // ========================================
    // parseClipboardContent
    // ========================================

    /**
     * @tc.number SUB_VALIDATION_CLIPBOARD_UTILS_1400
     * @tc.name testValidationClipboardUtils0014
     * @tc.desc 正向: parseClipboardContent 按优先级正确识别各类型
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationClipboardUtils0014', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationClipboardUtils0014 begin');
      const clip: ClipboardUtils = new ClipboardUtils();
      const urlResult = clip.parseClipboardContent('https://example.com');
      expect(urlResult.type).assertEqual(ClipboardDataType.URL);
      expect(urlResult.data).assertEqual('https://example.com');
      const htmlResult = clip.parseClipboardContent('<span>hi</span>');
      expect(htmlResult.type).assertEqual(ClipboardDataType.HTML);
      const imgResult = clip.parseClipboardContent('image://pic/1');
      expect(imgResult.type).assertEqual(ClipboardDataType.IMAGE);
      const textResult = clip.parseClipboardContent('just plain text');
      expect(textResult.type).assertEqual(ClipboardDataType.TEXT);
      expect(textResult.data).assertEqual('just plain text');
    });

    // ========================================
    // 操作历史
    // ========================================

    /**
     * @tc.number SUB_VALIDATION_CLIPBOARD_UTILS_1500
     * @tc.name testValidationClipboardUtils0015
     * @tc.desc 正向: setData/getData/clear 均记录操作历史
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testValidationClipboardUtils0015', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationClipboardUtils0015 begin');
      const clip: ClipboardUtils = new ClipboardUtils();
      expect(clip.getOperationHistory().length).assertEqual(0);
      clip.setData('abc');
      expect(clip.getOperationHistory().length).assertEqual(1);
      clip.getData();
      expect(clip.getOperationHistory().length).assertEqual(2);
      clip.clear();
      expect(clip.getOperationHistory().length).assertEqual(3);
      const history: string[] = clip.getOperationHistory();
      expect(history[0].indexOf('SET')).assertLarger(-1);
      expect(history[1].indexOf('GET')).assertLarger(-1);
      expect(history[2].indexOf('CLEAR')).assertLarger(-1);
    });

    /**
     * @tc.number SUB_VALIDATION_CLIPBOARD_UTILS_1600
     * @tc.name testValidationClipboardUtils0016
     * @tc.desc 边界: 操作历史不超过最大条数 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testValidationClipboardUtils0016', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationClipboardUtils0016 begin');
      const clip: ClipboardUtils = new ClipboardUtils();
      for (let i: number = 0; i < 60; i++) {
        clip.setData('data_' + i.toString());
      }
      const history: string[] = clip.getOperationHistory();
      expect(history.length).assertEqual(50);
      expect(history[0].indexOf('SET')).assertLarger(-1);
      expect(history[49].indexOf('SET')).assertLarger(-1);
    });

    /**
     * @tc.number SUB_VALIDATION_CLIPBOARD_UTILS_1700
     * @tc.name testValidationClipboardUtils0017
     * @tc.desc 边界: 新建实例初始状态无数据、无监听器、无历史
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationClipboardUtils0017', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationClipboardUtils0017 begin');
      const clip: ClipboardUtils = new ClipboardUtils();
      expect(clip.hasData()).assertFalse();
      expect(clip.getData()).assertEqual('');
      expect(clip.getDataType()).assertEqual(ClipboardDataType.UNKNOWN);
      expect(clip.getListenerCount()).assertEqual(0);
    });
  });
}
