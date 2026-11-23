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
import vibratorTransientAmplitudeTable01 from './VibratorTransientAmplitudeTable01.test';
import vibratorTransientAmplitudeTable02 from './VibratorTransientAmplitudeTable02.test';
import vibratorTransientAmplitudeTable03 from './VibratorTransientAmplitudeTable03.test';
import vibratorTransientOptionTable01 from './VibratorTransientOptionTable01.test';
import vibratorTransientOptionTable02 from './VibratorTransientOptionTable02.test';
import vibratorContinuousScheduleTable01 from './VibratorContinuousScheduleTable01.test';
import vibratorContinuousScheduleTable02 from './VibratorContinuousScheduleTable02.test';
import vibratorContinuousScheduleTable03 from './VibratorContinuousScheduleTable03.test';
import vibratorContinuousScheduleTable04 from './VibratorContinuousScheduleTable04.test';
import vibratorContinuousScheduleTable05 from './VibratorContinuousScheduleTable05.test';
import vibratorContinuousScheduleTable06 from './VibratorContinuousScheduleTable06.test';
import vibratorContinuousScheduleTable07 from './VibratorContinuousScheduleTable07.test';
import vibratorContinuousScheduleTable08 from './VibratorContinuousScheduleTable08.test';
import vibratorContinuousScheduleTable09 from './VibratorContinuousScheduleTable09.test';
import vibratorContinuousScheduleTable10 from './VibratorContinuousScheduleTable10.test';
import vibratorContinuousScheduleTable11 from './VibratorContinuousScheduleTable11.test';
import vibratorContinuousScheduleTable12 from './VibratorContinuousScheduleTable12.test';
import vibratorContinuousAmplitudeTable01 from './VibratorContinuousAmplitudeTable01.test';
import vibratorContinuousAmplitudeTable02 from './VibratorContinuousAmplitudeTable02.test';
import vibratorContinuousAmplitudeTable03 from './VibratorContinuousAmplitudeTable03.test';
import vibratorContinuousOptionTable01 from './VibratorContinuousOptionTable01.test';
import vibratorContinuousOptionTable02 from './VibratorContinuousOptionTable02.test';
import vibratorContinuousCurveTable01 from './VibratorContinuousCurveTable01.test';
import vibratorContinuousCurveTable02 from './VibratorContinuousCurveTable02.test';
import vibratorContinuousCurveTable03 from './VibratorContinuousCurveTable03.test';
import vibratorContinuousCurveTable04 from './VibratorContinuousCurveTable04.test';
import vibratorContinuousCurveTable05 from './VibratorContinuousCurveTable05.test';
import vibratorMixedSequence101 from './VibratorMixedSequence101.test';
import vibratorMixedSequence201 from './VibratorMixedSequence201.test';
import vibratorMixedSequence301 from './VibratorMixedSequence301.test';
import vibratorMixedSequence401 from './VibratorMixedSequence401.test';
import vibratorMixedSequence501 from './VibratorMixedSequence501.test';
import vibratorMixedSequence601 from './VibratorMixedSequence601.test';
import vibratorMixedSequence701 from './VibratorMixedSequence701.test';
import vibratorMixedSequence801 from './VibratorMixedSequence801.test';
import vibratorPatternBuilderMatrix from './VibratorPatternBuilderMatrix.test';
import vibratorPatternBuilderGuard from './VibratorPatternBuilderGuard.test';
import vibratorBuilderStateGuard from './VibratorBuilderStateGuard.test';
import abilityTest from './Ability.test';
import vibratorSample from './VibratorSample.test';
import vibratorPickerSequence from './VibratorPickerSequence.test';

export default function testsuite(): void {
  // Run the real-device UI suites first: the long resource/pattern suites can let the
  // device go to sleep or move another window to the foreground, which makes the
  // UiTest driver unable to find the vibrator page.
  vibratorSample();
  vibratorPickerSequence();
  vibratorTransientAmplitudeTable01();
  vibratorTransientAmplitudeTable02();
  vibratorTransientAmplitudeTable03();
  vibratorTransientOptionTable01();
  vibratorTransientOptionTable02();
  vibratorContinuousScheduleTable01();
  vibratorContinuousScheduleTable02();
  vibratorContinuousScheduleTable03();
  vibratorContinuousScheduleTable04();
  vibratorContinuousScheduleTable05();
  vibratorContinuousScheduleTable06();
  vibratorContinuousScheduleTable07();
  vibratorContinuousScheduleTable08();
  vibratorContinuousScheduleTable09();
  vibratorContinuousScheduleTable10();
  vibratorContinuousScheduleTable11();
  vibratorContinuousScheduleTable12();
  vibratorContinuousAmplitudeTable01();
  vibratorContinuousAmplitudeTable02();
  vibratorContinuousAmplitudeTable03();
  vibratorContinuousOptionTable01();
  vibratorContinuousOptionTable02();
  vibratorContinuousCurveTable01();
  vibratorContinuousCurveTable02();
  vibratorContinuousCurveTable03();
  vibratorContinuousCurveTable04();
  vibratorContinuousCurveTable05();
  vibratorMixedSequence101();
  vibratorMixedSequence201();
  vibratorMixedSequence301();
  vibratorMixedSequence401();
  vibratorMixedSequence501();
  vibratorMixedSequence601();
  vibratorMixedSequence701();
  vibratorMixedSequence801();
  vibratorPatternBuilderMatrix();
  vibratorPatternBuilderGuard();
  vibratorBuilderStateGuard();
  abilityTest();
}
