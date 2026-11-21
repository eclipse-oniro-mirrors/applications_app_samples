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

import abilityTest from './Ability.test';
import weatherInputInteractionSuite from './Core/WeatherInputInteraction.test';
import weatherConfigurationManagerValidationSuite from './Validation/WeatherConfigurationManagerValidation.test';
import weatherDataSourceValidationSuite from './Validation/WeatherDataSourceValidation.test';
import weatherCityCatalogValidationSuite from './Validation/WeatherCityCatalogValidation.test';
import weatherButtonInteractionSuite from './Interaction/WeatherButtonInteraction.test';
import weatherThemeVariationSuite from './Interaction/WeatherThemeVariation.test';
import weatherComprehensiveRegressionSuite from './Integration/WeatherComprehensiveRegression.test';
import weatherExtensionLifecycleSuite from './LifecycleState/WeatherExtensionLifecycle.test';
import weatherPerformanceStressSuite from './PerformanceStability/WeatherPerformanceStress.test';
import weatherExtensionSuite from './WeatherExtension.test';

export default function testsuite() {
  abilityTest();
  weatherInputInteractionSuite();
  weatherConfigurationManagerValidationSuite();
  weatherDataSourceValidationSuite();
  weatherCityCatalogValidationSuite();
  weatherButtonInteractionSuite();
  weatherThemeVariationSuite();
  weatherComprehensiveRegressionSuite();
  weatherExtensionLifecycleSuite();
  weatherPerformanceStressSuite();
  weatherExtensionSuite();
}
