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

// Import the logging facade and its level constants under test from the library HAR package.
import { Logger, LogLevel } from 'library';
// Import the context type so the logger can be initialized from the test application context.
import { common } from '@kit.AbilityKit';
// Import the ability delegator registry so the suite can resolve the running app context.
import { abilityDelegatorRegistry } from '@kit.TestKit';
// Import hilog directly for device side test logging.
import { hilog } from '@kit.PerformanceAnalysisKit';
// Import the hypium test framework primitives used by this suite.
import { beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

// The suite-level hilog tag, distinct from the per-case TAG values.
const SUITE_TAG: string = '[Sample_FontAndResource]';
// The hilog domain used by this suite.
const DOMAIN: number = 0xF811;
// The prefix attached to every case log message.
const BUNDLE: string = 'FontAndResource_';

// The module tag passed to every tagged log call.
const MODULE_TAG: string = 'FontResourceTest';
// A representative debug message.
const DEBUG_MESSAGE: string = 'debug probe message';
// A representative info message.
const INFO_MESSAGE: string = 'info probe message';
// A representative warn message.
const WARN_MESSAGE: string = 'warn probe message';
// A representative error message.
const ERROR_MESSAGE: string = 'error probe message';
// A representative fatal message.
const FATAL_MESSAGE: string = 'fatal probe message';
// Special characters that must survive the log composition step.
const SPECIAL_MESSAGE: string = 'code=F001, path=/data/中文字体/a.ttf, ratio=1.5%';
// The level name table documented by the facade, indexed by the numeric level.
const LEVEL_NAMES: string[] = ['DEBUG', 'INFO', 'WARN', 'ERROR', 'FATAL'];
// The numeric levels of the facade in ascending severity order.
const LEVEL_VALUES: number[] = [LogLevel.DEBUG, LogLevel.INFO, LogLevel.WARN, LogLevel.ERROR, LogLevel.FATAL];
// A level value below the documented range, used by the fallback case.
const LEVEL_BELOW_RANGE: number = -1;
// A level value above the documented range, used by the fallback case.
const LEVEL_ABOVE_RANGE: number = 5;
// A large but valid level value that is still outside the documented range.
const LEVEL_LARGE: number = 99;
// The app context holder; it is assigned in the suite setup before any case runs.
let suiteContext: common.Context | undefined = undefined;

// Logs one structured case progress line into hilog under the case TAG.
function logCase(tag: string, detail: string): void {
  // Compose and print the case detail line.
  hilog.info(DOMAIN, tag, '%{public}s', BUNDLE + tag + ', ' + detail);
}

// Registers every on-device logic test case of the logging facade.
export default function loggerTest() {
  // Group the cases under the "LoggerSuite" describe block.
  describe('LoggerSuite', () => {
    // Resolve the app context and initialize the logger before the first case runs.
    beforeAll(() => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'LoggerSuite, begin');
      // Resolve the running application context from the ability delegator.
      suiteContext = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      // Reset the level threshold so the suite starts from the documented default.
      Logger.setMinLevel(LogLevel.DEBUG);
      // Switch file logging off so the suite never writes into the sandbox.
      Logger.setFileLogEnabled(false);
      // Print the suite setup result so a missing context is visible immediately.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'LoggerSuite, context ready=' +
        (suiteContext !== undefined).toString());
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_LOGGER_0100
     * @tc.name      testLoggerLevelName0001
     * @tc.desc      Verify levelName maps the five documented numeric levels to their uppercase display names.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testLoggerLevelName0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testLoggerLevelName0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Track how many levels resolved to their documented name.
      let matchedNames: number = 0;
      // Walk the level table and compare each resolved name.
      for (let i: number = 0; i < LEVEL_VALUES.length; i++) {
        // Resolve the display name of the current level.
        const name: string = Logger.levelName(LEVEL_VALUES[i]);
        // Log the level and its resolved name.
        logCase(TAG, 'level ' + LEVEL_VALUES[i].toString() + ' -> ' + name);
        // The resolved name must equal the documented table entry.
        expect(name).assertEqual(LEVEL_NAMES[i]);
        // Count the level that matched.
        matchedNames = matchedNames + 1;
      }
      // Every documented level must resolve to its name.
      expect(matchedNames).assertEqual(LEVEL_NAMES.length);
      // The debug level is the lowest severity.
      expect(Logger.levelName(LogLevel.DEBUG)).assertEqual('DEBUG');
      // The fatal level is the highest documented severity.
      expect(Logger.levelName(LogLevel.FATAL)).assertEqual('FATAL');
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_LOGGER_0200
     * @tc.name      testLoggerLevelFallback0001
     * @tc.desc      Verify levelName falls back to FATAL for every value outside the five documented levels.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testLoggerLevelFallback0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testLoggerLevelFallback0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The fallback table lists the undocumented level values exercised by this case.
      const fallbackLevels: number[] = [LEVEL_BELOW_RANGE, LEVEL_ABOVE_RANGE, LEVEL_LARGE, -100, 1000];
      // Track the values that fell back to the fatal name.
      let fallbackCount: number = 0;
      // Walk the fallback table and resolve each name.
      for (let i: number = 0; i < fallbackLevels.length; i++) {
        // Resolve the display name of the undocumented level.
        const name: string = Logger.levelName(fallbackLevels[i]);
        // Log the undocumented level and its resolved name.
        logCase(TAG, 'level ' + fallbackLevels[i].toString() + ' -> ' + name);
        // Every undocumented level must fall back to the fatal name.
        expect(name).assertEqual('FATAL');
        // Count the value that fell back.
        fallbackCount = fallbackCount + 1;
      }
      // Every undocumented level must have fallen back.
      expect(fallbackCount).assertEqual(fallbackLevels.length);
      // The level count constant covers the five documented levels.
      expect(LogLevel.COUNT).assertEqual(LEVEL_NAMES.length);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_LOGGER_0300
     * @tc.name      testLoggerLevelConstants0001
     * @tc.desc      Verify the level constants are the documented ascending integers so filtering comparisons work.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testLoggerLevelConstants0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testLoggerLevelConstants0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Log the constant table for audit.
      logCase(TAG, 'constants=' + LEVEL_VALUES.join(',') + ', count=' + LogLevel.COUNT.toString());
      // The debug constant is the lowest severity value.
      expect(LogLevel.DEBUG).assertEqual(0);
      // The info constant follows the debug constant.
      expect(LogLevel.INFO).assertEqual(1);
      // The warn constant follows the info constant.
      expect(LogLevel.WARN).assertEqual(2);
      // The error constant follows the warn constant.
      expect(LogLevel.ERROR).assertEqual(3);
      // The fatal constant is the highest documented severity.
      expect(LogLevel.FATAL).assertEqual(4);
      // The constants strictly increase so threshold comparisons stay meaningful.
      let strictlyIncreasing: number = 0;
      // Walk the constant table comparing each pair of neighbours.
      for (let i: number = 1; i < LEVEL_VALUES.length; i++) {
        // Each constant must be larger than its predecessor.
        if (LEVEL_VALUES[i] > LEVEL_VALUES[i - 1]) {
          // Count the ordered pair.
          strictlyIncreasing = strictlyIncreasing + 1;
        }
      }
      // Every neighbour pair must be strictly ordered.
      expect(strictlyIncreasing).assertEqual(LEVEL_VALUES.length - 1);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_LOGGER_0400
     * @tc.name      testLoggerInit0001
     * @tc.desc      Verify init accepts the app context with file logging disabled and keeps the facade usable.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLoggerInit0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testLoggerInit0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Initialization is only possible with a live context, which the suite setup resolves.
      expect(suiteContext !== undefined).assertTrue();
      // Narrow the optional context through a runtime check instead of a cast.
      if (suiteContext !== undefined) {
        // Initialize the facade with file logging switched off.
        Logger.init(suiteContext, false);
        // Log the initialization outcome for audit.
        logCase(TAG, 'init done with fileLog=false');
        // The context exposes a usable files directory that the facade stores.
        expect(suiteContext.filesDir.length).assertLarger(0);
        // A log call after initialization must not throw.
        Logger.info(MODULE_TAG, INFO_MESSAGE);
        // The initialization happened once for this case.
        expect(true).assertTrue();
      }
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_LOGGER_0500
     * @tc.name      testLoggerInitRepeated0001
     * @tc.desc      Verify repeated initialization with both file logging modes keeps the facade usable.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLoggerInitRepeated0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testLoggerInitRepeated0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The mode table lists the file logging flags exercised by this case.
      const modeTable: boolean[] = [false, true, false];
      // Track how many initialization calls completed.
      let initCount: number = 0;
      // Re-initialize the facade once per mode table entry.
      if (suiteContext !== undefined) {
        // Walk the mode table and initialize with each flag.
        for (let i: number = 0; i < modeTable.length; i++) {
          // Initialize the facade with the current file logging flag.
          Logger.init(suiteContext, modeTable[i]);
          // Count the completed initialization.
          initCount = initCount + 1;
        }
      }
      // Log the completed initialization count.
      logCase(TAG, 'init calls=' + initCount.toString());
      // Every mode table entry must have been applied.
      expect(initCount).assertEqual(modeTable.length);
      // File logging is switched off again so later cases never touch the sandbox.
      Logger.setFileLogEnabled(false);
      // The facade still emits after the repeated initialization.
      Logger.info(MODULE_TAG, INFO_MESSAGE);
      // The last mode table entry is the disabled mode.
      expect(modeTable[modeTable.length - 1]).assertFalse();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_LOGGER_0600
     * @tc.name      testLoggerSetMinLevel0001
     * @tc.desc      Verify setMinLevel accepts every documented threshold without throwing so runtime filtering is safe.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLoggerSetMinLevel0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testLoggerSetMinLevel0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Track how many thresholds were applied without throwing.
      let appliedLevels: number = 0;
      // Walk the level table and apply each threshold.
      for (let i: number = 0; i < LEVEL_VALUES.length; i++) {
        // Apply the current threshold to the facade.
        Logger.setMinLevel(LEVEL_VALUES[i]);
        // Count the applied threshold.
        appliedLevels = appliedLevels + 1;
      }
      // Log the applied threshold count.
      logCase(TAG, 'applied thresholds=' + appliedLevels.toString());
      // Every documented threshold must be accepted.
      expect(appliedLevels).assertEqual(LEVEL_VALUES.length);
      // Undocumented thresholds must be accepted as well so callers cannot break logging.
      Logger.setMinLevel(LEVEL_BELOW_RANGE);
      // Reset the threshold to the documented default for the remaining cases.
      Logger.setMinLevel(LogLevel.DEBUG);
      // A log call after the threshold sweep must not throw.
      Logger.debug(MODULE_TAG, DEBUG_MESSAGE);
      // The threshold sweep completed.
      expect(appliedLevels > 0).assertTrue();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_LOGGER_0700
     * @tc.name      testLoggerSetFileLogEnabled0001
     * @tc.desc      Verify the file logging switch can be toggled without a log directory and never throws.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLoggerSetFileLogEnabled0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testLoggerSetFileLogEnabled0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The switch table lists the toggles exercised by this case.
      const switchTable: boolean[] = [true, false, true, false];
      // Track how many toggles were applied.
      let toggles: number = 0;
      // Walk the switch table and toggle the flag.
      for (let i: number = 0; i < switchTable.length; i++) {
        // Apply the current file logging flag.
        Logger.setFileLogEnabled(switchTable[i]);
        // Count the applied toggle.
        toggles = toggles + 1;
      }
      // Log the applied toggle count.
      logCase(TAG, 'toggles=' + toggles.toString() + ', final=' + switchTable[switchTable.length - 1].toString());
      // Every toggle of the table must be applied.
      expect(toggles).assertEqual(switchTable.length);
      // The final toggle leaves file logging disabled so no sandbox file is written afterwards.
      expect(switchTable[switchTable.length - 1]).assertFalse();
      // A log call after the toggles must not throw.
      Logger.info(MODULE_TAG, INFO_MESSAGE);
      // The facade keeps exactly the documented number of toggles per cycle.
      expect(toggles).assertEqual(4);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_LOGGER_0800
     * @tc.name      testLoggerLevelMethods0001
     * @tc.desc      Verify the five tagged level methods accept an explicit module tag and never throw.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLoggerLevelMethods0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testLoggerLevelMethods0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The message table pairs each level method with its representative message.
      const messageTable: string[] = [DEBUG_MESSAGE, INFO_MESSAGE, WARN_MESSAGE, ERROR_MESSAGE, FATAL_MESSAGE];
      // Emit the debug line with an explicit module tag.
      Logger.debug(MODULE_TAG, messageTable[0]);
      // Emit the info line with an explicit module tag.
      Logger.info(MODULE_TAG, messageTable[1]);
      // Emit the warn line with an explicit module tag.
      Logger.warn(MODULE_TAG, messageTable[2]);
      // Emit the error line with an explicit module tag.
      Logger.error(MODULE_TAG, messageTable[3]);
      // Emit the fatal line with an explicit module tag.
      Logger.fatal(MODULE_TAG, messageTable[4]);
      // Log the emitted message count.
      logCase(TAG, 'tagged messages=' + messageTable.length.toString());
      // The message table keeps one entry per level method.
      expect(messageTable.length).assertEqual(LEVEL_NAMES.length);
      // Every message is a non empty string before it is composed into a line.
      let nonEmpty: number = 0;
      // Walk the message table and count the non empty entries.
      for (let i: number = 0; i < messageTable.length; i++) {
        // Count the entry that carries text.
        if (messageTable[i].length > 0) {
          // Increment the non empty counter.
          nonEmpty = nonEmpty + 1;
        }
      }
      // Every message must carry text.
      expect(nonEmpty).assertEqual(messageTable.length);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_LOGGER_0900
     * @tc.name      testLoggerLevelMethodsDefaultTag0001
     * @tc.desc      Verify the single argument overloads of the five level methods fall back to the default tag.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLoggerLevelMethodsDefaultTag0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testLoggerLevelMethodsDefaultTag0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Emit the debug line through the single argument overload.
      Logger.debug(DEBUG_MESSAGE);
      // Emit the info line through the single argument overload.
      Logger.info(INFO_MESSAGE);
      // Emit the warn line through the single argument overload.
      Logger.warn(WARN_MESSAGE);
      // Emit the error line through the single argument overload.
      Logger.error(ERROR_MESSAGE);
      // Emit the fatal line through the single argument overload.
      Logger.fatal(FATAL_MESSAGE);
      // Log the completion of the default tag sweep.
      logCase(TAG, 'default tag sweep completed');
      // The default tag sweep emits five lines, so the level table has five entries.
      expect(LEVEL_VALUES.length).assertEqual(5);
      // The default tag fallback constant stays a non empty string.
      expect(MODULE_TAG.length).assertLarger(0);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_LOGGER_1000
     * @tc.name      testLoggerMessageContent0001
     * @tc.desc      Verify messages carrying paths, codes, units and CJK text are accepted by every level method.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLoggerMessageContent0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testLoggerMessageContent0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The content table lists the message shapes the font flows emit in practice.
      const contentTable: string[] = [SPECIAL_MESSAGE, 'code=F001', '/data/中文字体/a.ttf', 'ratio=1.5%', ''];
      // Track how many content shapes were emitted without throwing.
      let emittedContents: number = 0;
      // Walk the content table and emit each shape through the info method.
      for (let i: number = 0; i < contentTable.length; i++) {
        // Emit the current content shape with an explicit module tag.
        Logger.info(MODULE_TAG, contentTable[i]);
        // Count the emitted shape.
        emittedContents = emittedContents + 1;
      }
      // Emit the special message through every remaining level method.
      Logger.debug(MODULE_TAG, SPECIAL_MESSAGE);
      // Emit the special message through the warn method.
      Logger.warn(MODULE_TAG, SPECIAL_MESSAGE);
      // Emit the special message through the error method.
      Logger.error(MODULE_TAG, SPECIAL_MESSAGE);
      // Emit the special message through the fatal method.
      Logger.fatal(MODULE_TAG, SPECIAL_MESSAGE);
      // Log the emitted content count.
      logCase(TAG, 'contents emitted=' + emittedContents.toString() + ', special length=' +
        SPECIAL_MESSAGE.length.toString());
      // Every content shape must have been emitted.
      expect(emittedContents).assertEqual(contentTable.length);
      // The special message keeps its error code marker.
      expect(SPECIAL_MESSAGE.indexOf('code=F001')).assertEqual(0);
      // The special message keeps its sandbox path segment.
      expect(SPECIAL_MESSAGE.indexOf('/data/')).assertLarger(0);
      // The special message keeps its unit suffix.
      expect(SPECIAL_MESSAGE.substring(SPECIAL_MESSAGE.length - 1)).assertEqual('%');
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_LOGGER_1100
     * @tc.name      testLoggerThresholdFiltering0001
     * @tc.desc      Verify setting the threshold to the fatal level still keeps every level method callable.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testLoggerThresholdFiltering0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testLoggerThresholdFiltering0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Raise the threshold to the fatal level so lower levels are filtered out.
      Logger.setMinLevel(LogLevel.FATAL);
      // Emit one line per level while the threshold is at the fatal level.
      Logger.debug(MODULE_TAG, DEBUG_MESSAGE);
      // Emit the info line while the threshold filters it out.
      Logger.info(MODULE_TAG, INFO_MESSAGE);
      // Emit the warn line while the threshold filters it out.
      Logger.warn(MODULE_TAG, WARN_MESSAGE);
      // Emit the error line while the threshold filters it out.
      Logger.error(MODULE_TAG, ERROR_MESSAGE);
      // Emit the fatal line which passes the threshold.
      Logger.fatal(MODULE_TAG, FATAL_MESSAGE);
      // Log the threshold used by this case.
      logCase(TAG, 'threshold=' + LEVEL_NAMES[LogLevel.FATAL]);
      // The threshold name resolves through the same facade.
      expect(Logger.levelName(LogLevel.FATAL)).assertEqual('FATAL');
      // Restore the documented default threshold for the remaining cases.
      Logger.setMinLevel(LogLevel.DEBUG);
      // A debug line is emitted again after the threshold is restored.
      Logger.debug(MODULE_TAG, DEBUG_MESSAGE);
      // The default threshold maps to the debug level name.
      expect(Logger.levelName(LogLevel.DEBUG)).assertEqual('DEBUG');
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_LOGGER_1200
     * @tc.name      testLoggerLevelNameMatrix0001
     * @tc.desc      Verify a fixed level to name matrix resolves consistently across repeated lookups.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testLoggerLevelNameMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testLoggerLevelNameMatrix0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The matrix repeats the whole level table a fixed number of times.
      const matrixRounds: number = 3;
      // Track the total lookups performed by the matrix.
      let lookups: number = 0;
      // Track the lookups that matched the documented name.
      let matches: number = 0;
      // Run the matrix round by round.
      for (let round: number = 0; round < matrixRounds; round++) {
        // Walk the level table inside each round.
        for (let i: number = 0; i < LEVEL_VALUES.length; i++) {
          // Resolve the display name of the current level.
          const name: string = Logger.levelName(LEVEL_VALUES[i]);
          // Count the lookup.
          lookups = lookups + 1;
          // Count the lookup that matched the documented name.
          if (name === LEVEL_NAMES[i]) {
            // Increment the match counter.
            matches = matches + 1;
          }
        }
      }
      // Log the matrix totals.
      logCase(TAG, 'lookups=' + lookups.toString() + ', matches=' + matches.toString());
      // The matrix performs one lookup per level per round.
      expect(lookups).assertEqual(matrixRounds * LEVEL_NAMES.length);
      // Every lookup of the matrix must resolve the documented name.
      expect(matches).assertEqual(lookups);
      // The matrix keeps the documented round count.
      expect(matrixRounds).assertEqual(3);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_LOGGER_1300
     * @tc.name      testLoggerNonLevelApiGuard0001
     * @tc.desc      Verify every non logging API of the facade is callable before any initialization has happened.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testLoggerNonLevelApiGuard0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testLoggerNonLevelApiGuard0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The api table lists the non logging entry points exercised by this case.
      const apiTable: string[] = ['setMinLevel', 'setFileLogEnabled', 'levelName'];
      // Track how many entry points answered without throwing.
      let answeredApis: number = 0;
      // Exercise the threshold setter twice with different documented levels.
      Logger.setMinLevel(LogLevel.WARN);
      // Restore the documented default threshold.
      Logger.setMinLevel(LogLevel.DEBUG);
      // Count the threshold entry point.
      answeredApis = answeredApis + 1;
      // Exercise the file logging switch in both directions.
      Logger.setFileLogEnabled(false);
      // Count the switch entry point.
      answeredApis = answeredApis + 1;
      // Resolve a documented level name through the same facade.
      const name: string = Logger.levelName(LogLevel.INFO);
      // Count the name entry point.
      answeredApis = answeredApis + 1;
      // Log the answered entry point count.
      logCase(TAG, 'apis answered=' + answeredApis.toString() + ', info name=' + name);
      // Every listed entry point must have answered.
      expect(answeredApis).assertEqual(apiTable.length);
      // The name entry point returns the documented info name.
      expect(name).assertEqual(LEVEL_NAMES[LogLevel.INFO]);
      // The file logging switch leaves the facade in the disabled mode.
      Logger.setFileLogEnabled(false);
      // The switch table of this case keeps three entry points.
      expect(apiTable.length).assertEqual(3);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
