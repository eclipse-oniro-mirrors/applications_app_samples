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

import { beforeEachIt } from '@ohos/hypium';

// Import every suite module registered into the global test runner.
import clipboardUtilTest from './ClipboardUtil.test';
import dateArithmeticMatrixTest from './DateArithmeticMatrix.test';
import dateArithmeticSweepTest from './DateArithmeticSweep.test';
import dateDataMatrixTest from './DateDataMatrix.test';
import dateDurationMatrixTest from './DateDurationMatrix.test';
import dateFormatSweepTest from './DateFormatSweep.test';
import dateFormattedMatrixTest from './DateFormattedMatrix.test';
import dateUtilsTest from './DateUtils.test';
import dateUtilsAdvancedTest from './DateUtilsAdvanced.test';
import deviceUtilsTest from './DeviceUtils.test';
import digestDataMatrixTest from './DigestDataMatrix.test';
import displayConversionMatrixTest from './DisplayConversionMatrix.test';
import displayUtilsTest from './DisplayUtils.test';
import encodingBase64MatrixTest from './EncodingBase64Matrix.test';
import encodingDataMatrixTest from './EncodingDataMatrix.test';
import encodingDigestMatrixTest from './EncodingDigestMatrix.test';
import encodingMatrixTest from './EncodingMatrix.test';
import encodingSweepTest from './EncodingSweep.test';
import encodingUrlMatrixTest from './EncodingUrlMatrix.test';
import encryptUtilsTest from './EncryptUtils.test';
import errorCodeMapTest from './ErrorCodeMap.test';
import fontResourceTest from './FontResource.test';
import fontTypesTest from './FontTypes.test';
import logTypesTest from './LogTypes.test';
import loggerTest from './Logger.test';
import modelTypesTest from './ModelTypes.test';
import networkUtilsTest from './NetworkUtils.test';
import numberUtilsTest from './NumberUtils.test';
import numberUtilsAdvancedTest from './NumberUtilsAdvanced.test';
import numericAngleMatrixTest from './NumericAngleMatrix.test';
import numericBoundaryMatrixTest from './NumericBoundaryMatrix.test';
import numericClampDataTest from './NumericClampData.test';
import numericClampMatrixTest from './NumericClampMatrix.test';
import numericClampSweepTest from './NumericClampSweep.test';
import numericDurationMatrixTest from './NumericDurationMatrix.test';
import numericFileSizeMatrixTest from './NumericFileSizeMatrix.test';
import numericFormatDataTest from './NumericFormatData.test';
import numericFormatSweepTest from './NumericFormatSweep.test';
import numericMathSweepTest from './NumericMathSweep.test';
import numericParseMatrixTest from './NumericParseMatrix.test';
import numericParseSweepTest from './NumericParseSweep.test';
import numericPercentMatrixTest from './NumericPercentMatrix.test';
import numericRandomMatrixTest from './NumericRandomMatrix.test';
import numericRoundDataTest from './NumericRoundData.test';
import numericRoundMatrixTest from './NumericRoundMatrix.test';
import numericRoundSweepTest from './NumericRoundSweep.test';
import numericThousandMatrixTest from './NumericThousandMatrix.test';
import parserMatrixTest from './ParserMatrix.test';
import permissionUtilsTest from './PermissionUtils.test';
import preferencesUtilTest from './PreferencesUtil.test';
import randomUtilsTest from './RandomUtils.test';
import { stringUtilsTest } from './StringUtils.test';
import stringUtilsAdvancedTest from './StringUtilsAdvanced.test';
import textCountMatrixTest from './TextCountMatrix.test';
import textDataMatrixTest from './TextDataMatrix.test';
import textNormalizeMatrixTest from './TextNormalizeMatrix.test';
import textPaddingMatrixTest from './TextPaddingMatrix.test';
import textTransformMatrixTest from './TextTransformMatrix.test';
import textTransformSweepTest from './TextTransformSweep.test';
import textValidationSweepTest from './TextValidationSweep.test';
import traceUtilTest from './TraceUtil.test';
import { validateUtilsTest } from './ValidateUtils.test';
import validateUtilsAdvancedTest from './ValidateUtilsAdvanced.test';
import validationCharacterMatrixTest from './ValidationCharacterMatrix.test';
import validationDataMatrixTest from './ValidationDataMatrix.test';
import validationMobileMatrixTest from './ValidationMobileMatrix.test';
import validationNetworkMatrixTest from './ValidationNetworkMatrix.test';

// DevEco treats nested expressions in testsuite as suite registration calls.
function yieldToEventLoop(): Promise<void> {
  return new Promise<void>((resolve: (value: void) => void) => {
    // 1 ms, not 0: libuv 1.44 fires a 0 ms timer set inside a timer callback in the same uv_run pass, so it never yields.
    setTimeout(() => {
      resolve();
    }, 1);
  });
}

// Registers every test suite of the entry ohosTest target.
export default function testsuite() {
  // ponytail: yields between cases only; split any single long-running case into batches.
  beforeEachIt(yieldToEventLoop);
  clipboardUtilTest();
  dateArithmeticMatrixTest();
  dateArithmeticSweepTest();
  dateDataMatrixTest();
  dateDurationMatrixTest();
  dateFormatSweepTest();
  dateFormattedMatrixTest();
  dateUtilsTest();
  dateUtilsAdvancedTest();
  deviceUtilsTest();
  digestDataMatrixTest();
  displayConversionMatrixTest();
  displayUtilsTest();
  encodingBase64MatrixTest();
  encodingDataMatrixTest();
  encodingDigestMatrixTest();
  encodingMatrixTest();
  encodingSweepTest();
  encodingUrlMatrixTest();
  encryptUtilsTest();
  errorCodeMapTest();
  fontResourceTest();
  fontTypesTest();
  logTypesTest();
  loggerTest();
  modelTypesTest();
  networkUtilsTest();
  numberUtilsTest();
  numberUtilsAdvancedTest();
  numericAngleMatrixTest();
  numericBoundaryMatrixTest();
  numericClampDataTest();
  numericClampMatrixTest();
  numericClampSweepTest();
  numericDurationMatrixTest();
  numericFileSizeMatrixTest();
  numericFormatDataTest();
  numericFormatSweepTest();
  numericMathSweepTest();
  numericParseMatrixTest();
  numericParseSweepTest();
  numericPercentMatrixTest();
  numericRandomMatrixTest();
  numericRoundDataTest();
  numericRoundMatrixTest();
  numericRoundSweepTest();
  numericThousandMatrixTest();
  parserMatrixTest();
  permissionUtilsTest();
  preferencesUtilTest();
  randomUtilsTest();
  stringUtilsTest();
  stringUtilsAdvancedTest();
  textCountMatrixTest();
  textDataMatrixTest();
  textNormalizeMatrixTest();
  textPaddingMatrixTest();
  textTransformMatrixTest();
  textTransformSweepTest();
  textValidationSweepTest();
  traceUtilTest();
  validateUtilsTest();
  validateUtilsAdvancedTest();
  validationCharacterMatrixTest();
  validationDataMatrixTest();
  validationMobileMatrixTest();
  validationNetworkMatrixTest();
}
