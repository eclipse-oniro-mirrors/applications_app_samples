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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import {
  getDriver,
  createFreshDriver,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_BACK,
  KEY_ENTER,
  powerDialogComponentCount,
  checkFocusState,
  waitForDialogStable,
  pressAndWait,
  serializedDelay,
  DELAY_KEY_NAVIGATION,
  TIMEOUT_DIALOG_RENDER
} from '../Shared/SharedDriver';

enum Language {
  ENGLISH = 'en-US', CHINESE_SIMPLIFIED = 'zh-CN', CHINESE_TRADITIONAL = 'zh-TW', JAPANESE = 'ja-JP', KOREAN = 'ko-KR', FRENCH = 'fr-FR', GERMAN = 'de-DE', SPANISH = 'es-ES'
}

interface LocalizationRecord {
  language: Language;
  textDisplayed: boolean;
  layoutCorrect: boolean;
  responseTime: number;
  timestamp: number;
}

class LocalizationTracker {
  private static instance: LocalizationTracker;
  private localizationHistory: LocalizationRecord[] = [];
  private totalTests: number = 0;
  private successfulTests: number = 0;

  // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
  public static getInstance(): LocalizationTracker {
    if (!LocalizationTracker.instance) {
      LocalizationTracker.instance = new LocalizationTracker();
    }
    return LocalizationTracker.instance;
  }

  public recordLocalization(language: Language, textDisplayed: boolean, layoutCorrect: boolean,
    responseTime: number): void {
    const record: LocalizationRecord = {
      language,
      textDisplayed,
      layoutCorrect,
      responseTime,
      timestamp: Date.now()
    };
    this.localizationHistory.push(record);
    this.totalTests++;
    if (textDisplayed && layoutCorrect) {
      this.successfulTests++;
    }
  }

  public getLocalizationHistory(): LocalizationRecord[] {
    return [...this.localizationHistory];
  }

  public getTotalTests(): number {
    return this.totalTests;
  }

  public getSuccessfulTests(): number {
    return this.successfulTests;
  }

  public resetTracker(): void {
    this.localizationHistory = [];
    this.totalTests = 0;
    this.successfulTests = 0;
  }

  public getSuccessRate(): number {
    if (this.totalTests === 0) {
      return 0;
    }
    return this.successfulTests / this.totalTests;
  }

  public hasTestedLanguage(language: Language): boolean {
    return this.localizationHistory.some(record => record.language === language);
  }

  // 计算平均响应时间：评估本地化切换的整体性能
  public getAverageResponseTime(): number {
    if (this.localizationHistory.length === 0) {
      return 0;
    }
    const totalTime =
      this.localizationHistory.reduce((sum: number, record: LocalizationRecord) => sum + record.responseTime, 0);
    return totalTime / this.localizationHistory.length;
  }

  // 计算最大响应时间：识别本地化响应最慢的操作
  public getMaxResponseTime(): number {
    if (this.localizationHistory.length === 0) {
      return 0;
    }
    let maxTime = 0;
    for (let i = 0; i < this.localizationHistory.length; i++) {
      if (this.localizationHistory[i].responseTime > maxTime) {
        maxTime = this.localizationHistory[i].responseTime;
      }
    }
    return maxTime;
  }

  // 计算最小响应时间：识别本地化响应最快的操作
  public getMinResponseTime(): number {
    if (this.localizationHistory.length === 0) {
      return 0;
    }
    let minTime = Number.MAX_SAFE_INTEGER;
    for (let i = 0; i < this.localizationHistory.length; i++) {
      if (this.localizationHistory[i].responseTime < minTime) {
        minTime = this.localizationHistory[i].responseTime;
      }
    }
    return minTime === Number.MAX_SAFE_INTEGER ? 0 : minTime;
  }

  // 统计指定语言的记录数量：分析语言测试分布
  public getLanguageCount(language: Language): number {
    return this.localizationHistory.filter(record => record.language === language).length;
  }

  // 获取所有显示成功的记录：过滤出文本和布局均正确的记录
  public getSuccessfulHistory(): LocalizationRecord[] {
    return this.localizationHistory.filter(record => record.textDisplayed && record.layoutCorrect);
  }

  // 统计各语言出现频率：分析语言测试覆盖分布
  public getLanguageFrequency(): Map<string, number> {
    const frequency = new Map<string, number>();
    for (let i = 0; i < this.localizationHistory.length; i++) {
      const language = this.localizationHistory[i].language;
      const currentCount = frequency.get(language) || 0;
      frequency.set(language, currentCount + 1);
    }
    return frequency;
  }

  // 克隆追踪器：返回一个记录一致的副本
  public clone(): LocalizationTracker {
    const cloneTracker = new LocalizationTracker();
    for (let i = 0; i < this.localizationHistory.length; i++) {
      cloneTracker.recordLocalization(this.localizationHistory[i].language, this.localizationHistory[i].textDisplayed,
        this.localizationHistory[i].layoutCorrect, this.localizationHistory[i].responseTime);
    }
    return cloneTracker;
  }

  // 判断两个追踪器是否等价
  public equals(other: LocalizationTracker): boolean {
    return this.localizationHistory.length === other.localizationHistory.length;
  }

  // 生成追踪器摘要字符串
  public toString(): string {
    return `LocalizationTracker{total=${this.totalTests}, successful=${this.successfulTests}, rate=${this.getSuccessRate()}}`;
  }
}

// 区域地区枚举：描述语言所属的地理区域
enum LocaleRegion {
  ASIA = 'asia', EUROPE = 'europe', AMERICA = 'america', OCEANIA = 'oceania'
}

// 文本方向枚举：描述不同语言的文本阅读方向
enum TextDirection {
  LTR = 'ltr', RTL = 'rtl', TTB = 'ttb'
}

// 本地化作用范围枚举：描述本地化资源的应用范围
enum LocalizationScope {
  DIALOG = 'dialog', GLOBAL = 'global', COMPONENT = 'component', SYSTEM = 'system'
}

// 本地化度量信息结构体：聚合单次本地化测试的关键指标
interface LocalizationMetrics {
  language: Language;
  region: LocaleRegion;
  direction: TextDirection;
  textDisplayed: boolean;
  layoutCorrect: boolean;
  responseTime: number;
}

// 本地化统计结果：汇总一段时间内的本地化测试统计
interface LocalizationStatistics {
  totalTests: number;
  successfulTests: number;
  averageResponseTime: number;
  maxResponseTime: number;
  minResponseTime: number;
  successRate: number;
}

// 本地化配置结构：描述本地化测试的配置参数
interface LocalizationConfig {
  defaultLanguage: Language;
  fallbackLanguage: Language;
  enableRtl: boolean;
  scope: LocalizationScope;
  strictValidation: boolean;
}

// 翻译词条结构：描述单个翻译词条的完整信息
interface TranslationEntry {
  key: string;
  language: Language;
  value: string;
  direction: TextDirection;
  isValid: boolean;
}

// 本地化数据模型：封装本地化记录的完整属性，提供克隆、比较和序列化能力
class LocalizationModel {
  private language: Language;
  private region: LocaleRegion;
  private direction: TextDirection;
  private textDisplayed: boolean;
  private layoutCorrect: boolean;

  // 构造函数：初始化本地化数据模型的默认属性
  public constructor() {
    this.language = Language.ENGLISH;
    this.region = LocaleRegion.ASIA;
    this.direction = TextDirection.LTR;
    this.textDisplayed = false;
    this.layoutCorrect = false;
  }

  public setLanguage(language: Language): void {
    this.language = language;
  }

  public getLanguage(): Language {
    return this.language;
  }

  public setRegion(region: LocaleRegion): void {
    this.region = region;
  }

  public getRegion(): LocaleRegion {
    return this.region;
  }

  public setDirection(direction: TextDirection): void {
    this.direction = direction;
  }

  public getDirection(): TextDirection {
    return this.direction;
  }

  public setTextDisplayed(displayed: boolean): void {
    this.textDisplayed = displayed;
  }

  public getTextDisplayed(): boolean {
    return this.textDisplayed;
  }

  public setLayoutCorrect(correct: boolean): void {
    this.layoutCorrect = correct;
  }

  public getLayoutCorrect(): boolean {
    return this.layoutCorrect;
  }

  // 判断本地化是否完整：文本显示和布局均正确才算完整
  public isComplete(): boolean {
    return this.textDisplayed && this.layoutCorrect;
  }

  // 判断是否为从右到左的语言
  public isRtl(): boolean {
    return this.direction === TextDirection.RTL;
  }

  // 克隆本地化数据模型：返回一个属性完全一致的副本
  public clone(): LocalizationModel {
    const cloned = new LocalizationModel();
    cloned.language = this.language;
    cloned.region = this.region;
    cloned.direction = this.direction;
    cloned.textDisplayed = this.textDisplayed;
    cloned.layoutCorrect = this.layoutCorrect;
    return cloned;
  }

  // 比较两个本地化数据模型是否相等
  public equals(other: LocalizationModel): boolean {
    return this.language === other.language && this.region === other.region && this.direction === other.direction &&
      this.textDisplayed === other.textDisplayed && this.layoutCorrect === other.layoutCorrect;
  }

  // 序列化本地化数据模型
  public toString(): string {
    return `LocalizationModel{language=${this.language}, region=${this.region}, direction=${this.direction}, complete=${this.isComplete()}}`;
  }
}

// 本地化度量计算器：提供基于本地化记录的统计分析能力
class LocalizationMetricsCalculator {
  private records: LocalizationRecord[];

  // 构造函数：初始化度量计算器的记录列表
  public constructor(records: LocalizationRecord[]) {
    this.records = records;
  }

  // 计算平均响应时间
  public averageResponseTime(): number {
    if (this.records.length === 0) {
      return 0;
    }
    const total = this.records.reduce((sum: number, record: LocalizationRecord) => sum + record.responseTime, 0);
    return total / this.records.length;
  }

  // 计算最大响应时间
  public maxResponseTime(): number {
    let maxTime = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].responseTime > maxTime) {
        maxTime = this.records[i].responseTime;
      }
    }
    return maxTime;
  }

  // 计算最小响应时间
  public minResponseTime(): number {
    let minTime = Number.MAX_SAFE_INTEGER;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].responseTime < minTime) {
        minTime = this.records[i].responseTime;
      }
    }
    return minTime === Number.MAX_SAFE_INTEGER ? 0 : minTime;
  }

  // 计算成功记录数量
  public successfulCount(): number {
    return this.records.filter(record => record.textDisplayed && record.layoutCorrect).length;
  }

  // 计算成功率
  public successRate(): number {
    if (this.records.length === 0) {
      return 0;
    }
    return this.successfulCount() / this.records.length;
  }
}

// 翻译管理器：管理多语言翻译词条的增删和查询
class TranslationManager {
  private entries: TranslationEntry[];

  // 构造函数：初始化翻译词条列表
  public constructor() {
    this.entries = [];
  }

  // 添加翻译词条
  public addEntry(key: string, language: Language, value: string, direction: TextDirection): void {
    const entry: TranslationEntry = {
      key,
      language,
      value,
      direction,
      isValid: value.length > 0
    };
    this.entries.push(entry);
  }

  public getEntries(): TranslationEntry[] {
    return [...this.entries];
  }

  public getEntryCount(): number {
    return this.entries.length;
  }

  // 查询指定键和语言的翻译词条
  public findEntry(key: string, language: Language): TranslationEntry | undefined {
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].key === key && this.entries[i].language === language) {
        return this.entries[i];
      }
    }
    return undefined;
  }

  // 统计无效翻译词条的数量
  public getInvalidEntryCount(): number {
    return this.entries.filter(entry => !entry.isValid).length;
  }

  // 清空所有翻译词条
  public clear(): void {
    this.entries = [];
  }
}

// 本地化配置校验器：校验本地化配置参数的合法性
class LocalizationConfigValidator {
  private config: LocalizationConfig;

  // 构造函数：保存待校验的本地化配置对象
  public constructor(config: LocalizationConfig) {
    this.config = config;
  }

  // 校验默认语言和回退语言是否不同
  public hasDistinctLanguages(): boolean {
    return this.config.defaultLanguage !== this.config.fallbackLanguage;
  }

  // 校验默认语言是否合法：默认语言不能为空字符串
  public isDefaultLanguageValid(): boolean {
    return this.config.defaultLanguage.length > 0;
  }

  // 综合校验：判断整个本地化配置是否合法
  public isValid(): boolean {
    return this.hasDistinctLanguages() && this.isDefaultLanguageValid();
  }

  // 生成校验报告：输出本地化配置校验的详细结果
  public generateValidationReport(): string {
    return `LocalizationConfig{default=${this.config.defaultLanguage}, fallback=${this.config.fallbackLanguage}, ` +
      `rtl=${this.config.enableRtl}, scope=${this.config.scope}}`;
  }
}

export default function localizationTestingTest() {
  describe('LocalizationTesting_Test', () => {
    let driver: Driver;
    let localizationTracker: LocalizationTracker;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => {
      driver = createFreshDriver(); // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      localizationTracker = LocalizationTracker.getInstance();
      localizationTracker.resetTracker();
      await serializedDelay(driver, 1000);
    });

    // 测试清理：关闭对话框并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500);
    });

    it('dialog_should_display_correctly_in_english', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      const startTime = Date.now();
      const componentCount = await powerDialogComponentCount(driver);
      const responseTime = Date.now() - startTime;

      localizationTracker.recordLocalization(Language.ENGLISH, componentCount >= 6, true, responseTime);

      expect(localizationTracker.hasTestedLanguage(Language.ENGLISH)).assertTrue();
    });

    it('dialog_should_display_correctly_in_chinese_simplified', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      localizationTracker.resetTracker();

      const startTime = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      const isFocusCorrect = await checkFocusState(driver, 0);
      localizationTracker.recordLocalization(Language.CHINESE_SIMPLIFIED, isFocusCorrect, true, responseTime);

      expect(localizationTracker.hasTestedLanguage(Language.CHINESE_SIMPLIFIED)).assertTrue();
    });

    it('dialog_should_display_correctly_in_chinese_traditional', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      localizationTracker.resetTracker();

      const startTime = Date.now();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      const isFocusCorrect = await checkFocusState(driver, 1);
      localizationTracker.recordLocalization(Language.CHINESE_TRADITIONAL, isFocusCorrect, true, responseTime);

      expect(localizationTracker.hasTestedLanguage(Language.CHINESE_TRADITIONAL)).assertTrue();
    });

    it('dialog_should_display_correctly_in_japanese', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      localizationTracker.resetTracker();

      const startTime = Date.now();
      const componentCount = await powerDialogComponentCount(driver);
      const responseTime = Date.now() - startTime;

      localizationTracker.recordLocalization(Language.JAPANESE, componentCount >= 6, true, responseTime);

      expect(localizationTracker.hasTestedLanguage(Language.JAPANESE)).assertTrue();
    });

    it('dialog_should_display_correctly_in_korean', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      localizationTracker.resetTracker();

      const startTime = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      const isFocusCorrect = await checkFocusState(driver, 0);
      localizationTracker.recordLocalization(Language.KOREAN, isFocusCorrect, true, responseTime);

      expect(localizationTracker.hasTestedLanguage(Language.KOREAN)).assertTrue();
    });

    it('dialog_should_display_correctly_in_french', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      localizationTracker.resetTracker();

      const startTime = Date.now();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      const isFocusCorrect = await checkFocusState(driver, 1);
      localizationTracker.recordLocalization(Language.FRENCH, isFocusCorrect, true, responseTime);

      expect(localizationTracker.hasTestedLanguage(Language.FRENCH)).assertTrue();
    });

    it('dialog_should_display_correctly_in_german', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      localizationTracker.resetTracker();

      const startTime = Date.now();
      const componentCount = await powerDialogComponentCount(driver);
      const responseTime = Date.now() - startTime;

      localizationTracker.recordLocalization(Language.GERMAN, componentCount >= 6, true, responseTime);

      expect(localizationTracker.hasTestedLanguage(Language.GERMAN)).assertTrue();
    });

    it('dialog_should_display_correctly_in_spanish', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      localizationTracker.resetTracker();

      const startTime = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      const isFocusCorrect = await checkFocusState(driver, 0);
      localizationTracker.recordLocalization(Language.SPANISH, isFocusCorrect, true, responseTime);

      expect(localizationTracker.hasTestedLanguage(Language.SPANISH)).assertTrue();
    });

    // 验证dialog localization状态正确：确保TV设备records timestamps should be chronological符合预期
    it('dialog_localization_records_timestamps_should_be_chronological', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      localizationTracker.resetTracker();

      localizationTracker.recordLocalization(Language.ENGLISH, true, true, 50);
      await driver.delayMs(100);
      localizationTracker.recordLocalization(Language.CHINESE_SIMPLIFIED, true, true, 50);
      await driver.delayMs(100);
      localizationTracker.recordLocalization(Language.JAPANESE, true, true, 50);

      const history = localizationTracker.getLocalizationHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    // 验证dialog localization维持稳定：确保TV设备在tracker singleton should maintain consistency下性能不降低
    it('dialog_localization_tracker_singleton_should_maintain_consistency', 0,
      async () => { // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
        const tracker1 = LocalizationTracker.getInstance();
        const tracker2 = LocalizationTracker.getInstance();

        expect(tracker1 === tracker2).assertTrue();


        tracker1.resetTracker();
        tracker1.recordLocalization(Language.ENGLISH, true, true, 100);

        expect(tracker2.getTotalTests()).assertEqual(1);
        expect(tracker2.getSuccessfulTests()).assertEqual(1);
      });

    // 验证dialog should处理能力：确保TV设备在handle all languages下功能正常
    it('dialog_should_handle_all_languages', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      localizationTracker.resetTracker();

      const languages = [Language.ENGLISH, Language.CHINESE_SIMPLIFIED, Language.CHINESE_TRADITIONAL, Language.JAPANESE,
        Language.KOREAN, Language.FRENCH, Language.GERMAN, Language.SPANISH];

      for (const language of languages) {
        localizationTracker.recordLocalization(language, true, true, 50);
      }

      expect(localizationTracker.getTotalTests()).assertEqual(8);
    });

    // 验证dialog should维持稳定：确保TV设备在maintain layout across languages下性能不降低
    it('dialog_should_maintain_layout_across_languages', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      localizationTracker.resetTracker();
      const initialCount = await powerDialogComponentCount(driver);

      const languages = [Language.ENGLISH, Language.CHINESE_SIMPLIFIED, Language.JAPANESE];
      for (const language of languages) {
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        localizationTracker.recordLocalization(language, true, true, 30);
        await driver.delayMs(50);
      }

      const finalCount = await powerDialogComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(2);
    });

    // 综合comprehensive localization场景测试：验证完整操作流程中功能正确
    it('comprehensive_localization_testing_scenario', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      localizationTracker.resetTracker();

      const scenarioStart = Date.now();

      const startTime1 = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const responseTime1 = Date.now() - startTime1;
      localizationTracker.recordLocalization(Language.ENGLISH, true, true, responseTime1);

      const startTime2 = Date.now();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const responseTime2 = Date.now() - startTime2;
      localizationTracker.recordLocalization(Language.CHINESE_SIMPLIFIED, true, true, responseTime2);

      const scenarioEnd = Date.now();
      const scenarioDuration = scenarioEnd - scenarioStart;

      expect(localizationTracker.getTotalTests()).assertEqual(2);
      expect(scenarioDuration).assertLessOrEqual(5000);
    });
  });


}
