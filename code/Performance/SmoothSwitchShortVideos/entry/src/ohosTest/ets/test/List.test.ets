/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import IntegrationPolicy01 from './Integration/IntegrationPolicy01.test';
import IntegrationNotifications02 from './Integration/IntegrationNotifications02.test';
import IntegrationSurface03 from './Integration/IntegrationSurface03.test';
import IntegrationPolicy04 from './Integration/IntegrationPolicy04.test';
import IntegrationClock05 from './Integration/IntegrationClock05.test';
import IntegrationSeek06 from './Integration/IntegrationSeek06.test';
import IntegrationPolicy07 from './Integration/IntegrationPolicy07.test';
import IntegrationProgress08 from './Integration/IntegrationProgress08.test';
import IntegrationSource09 from './Integration/IntegrationSource09.test';
import InteractionSource01 from './Interaction/InteractionSource01.test';
import InteractionPolicy02 from './Interaction/InteractionPolicy02.test';
import InteractionSurface03 from './Interaction/InteractionSurface03.test';
import InteractionProgress04 from './Interaction/InteractionProgress04.test';
import InteractionSurface05 from './Interaction/InteractionSurface05.test';
import InteractionNotifications06 from './Interaction/InteractionNotifications06.test';
import InteractionNotifications07 from './Interaction/InteractionNotifications07.test';
import InteractionPolicy08 from './Interaction/InteractionPolicy08.test';
import InteractionSurface09 from './Interaction/InteractionSurface09.test';
import InteractionPolicy10 from './Interaction/InteractionPolicy10.test';
import InteractionSurface11 from './Interaction/InteractionSurface11.test';
import InteractionSeek12 from './Interaction/InteractionSeek12.test';
import InteractionProgress13 from './Interaction/InteractionProgress13.test';
import InteractionSurface14 from './Interaction/InteractionSurface14.test';
import LifecycleStateSurface01 from './LifecycleState/LifecycleStateSurface01.test';
import LifecycleStatePolicy02 from './LifecycleState/LifecycleStatePolicy02.test';
import LifecycleStateNotifications06 from './LifecycleState/LifecycleStateNotifications06.test';
import LifecycleStateNotifications07 from './LifecycleState/LifecycleStateNotifications07.test';
import LifecycleStateNotifications08 from './LifecycleState/LifecycleStateNotifications08.test';
import LifecycleStateNotifications09 from './LifecycleState/LifecycleStateNotifications09.test';
import PerformanceStabilitySurface01 from './PerformanceStability/PerformanceStabilitySurface01.test';
import PerformanceStabilityNotifications02 from './PerformanceStability/PerformanceStabilityNotifications02.test';
import PerformanceStabilityNotifications04 from './PerformanceStability/PerformanceStabilityNotifications04.test';
import PerformanceStabilitySource05 from './PerformanceStability/PerformanceStabilitySource05.test';
import PerformanceStabilityProgress07 from './PerformanceStability/PerformanceStabilityProgress07.test';
import PowerDialogNotifications01 from './PowerDialog/PowerDialogNotifications01.test';
import PowerDialogSurface08 from './PowerDialog/PowerDialogSurface08.test';
import PowerDialogSeek09 from './PowerDialog/PowerDialogSeek09.test';
import PowerDialogSource10 from './PowerDialog/PowerDialogSource10.test';
import PowerDialogSource11 from './PowerDialog/PowerDialogSource11.test';
import PowerDialogSource12 from './PowerDialog/PowerDialogSource12.test';
import PowerDialogSource13 from './PowerDialog/PowerDialogSource13.test';
import PowerValidationSource01 from './PowerValidation/PowerValidationSource01.test';
import PowerValidationSource03 from './PowerValidation/PowerValidationSource03.test';
import PowerValidationNotifications04 from './PowerValidation/PowerValidationNotifications04.test';
import PowerValidationNotifications06 from './PowerValidation/PowerValidationNotifications06.test';
import PowerValidationSeek07 from './PowerValidation/PowerValidationSeek07.test';
import PowerValidationNotifications08 from './PowerValidation/PowerValidationNotifications08.test';
import SecuritySource01 from './Security/SecuritySource01.test';
import SecuritySurface02 from './Security/SecuritySurface02.test';
import ValidationSurface01 from './Validation/ValidationSurface01.test';
import ValidationSeek02 from './Validation/ValidationSeek02.test';
import ValidationNotifications03 from './Validation/ValidationNotifications03.test';
import ValidationSource04 from './Validation/ValidationSource04.test';
import ValidationSeek07 from './Validation/ValidationSeek07.test';
import ValidationClock09 from './Validation/ValidationClock09.test';
import ValidationProgress10 from './Validation/ValidationProgress10.test';
import ValidationSource11 from './Validation/ValidationSource11.test';
import MatrixTime001 from './Matrix/MatrixTime001.test';
import MatrixTime002 from './Matrix/MatrixTime002.test';
import MatrixSurface001 from './Matrix/MatrixSurface001.test';
import MatrixSurface002 from './Matrix/MatrixSurface002.test';
import MatrixSurface003 from './Matrix/MatrixSurface003.test';
import MatrixSeek001 from './Matrix/MatrixSeek001.test';
import MatrixSeek002 from './Matrix/MatrixSeek002.test';
import MatrixSeek003 from './Matrix/MatrixSeek003.test';
import MatrixProgress001 from './Matrix/MatrixProgress001.test';
import MatrixProgress002 from './Matrix/MatrixProgress002.test';
import MatrixProgress003 from './Matrix/MatrixProgress003.test';
import MatrixCatalog001 from './Matrix/MatrixCatalog001.test';
import MatrixCatalog002 from './Matrix/MatrixCatalog002.test';
import MatrixNotifications001 from './Matrix/MatrixNotifications001.test';
import MatrixNotifications002 from './Matrix/MatrixNotifications002.test';
import MatrixParser001 from './Matrix/MatrixParser001.test';
import MatrixParser002 from './Matrix/MatrixParser002.test';
import driverContractTest from './Shared/SharedDriver';
import abilityTest from './Ability.test';
import videoUiTest from './VideoUi.test';
import playerRuntimeTest from './PlayerRuntime.test';
import { registerTestBatches, registerUiTests } from './Shared/HypiumSession';

export default function testsuite(): Promise<void> {
  return registerTestBatches([
    (): void => { IntegrationPolicy01(); },
    (): void => { IntegrationNotifications02(); },
    (): void => { IntegrationSurface03(); },
    (): void => { IntegrationPolicy04(); },
    (): void => { IntegrationClock05(); },
    (): void => { IntegrationSeek06(); },
    (): void => { IntegrationPolicy07(); },
    (): void => { IntegrationProgress08(); },
    (): void => { IntegrationSource09(); },
    (): void => { InteractionSource01(); },
    (): void => { InteractionPolicy02(); },
    (): void => { InteractionSurface03(); },
    (): void => { InteractionProgress04(); },
    (): void => { InteractionSurface05(); },
    (): void => { InteractionNotifications06(); },
    (): void => { InteractionNotifications07(); },
    (): void => { InteractionPolicy08(); },
    (): void => { InteractionSurface09(); },
    (): void => { InteractionPolicy10(); },
    (): void => { InteractionSurface11(); },
    (): void => { InteractionSeek12(); },
    (): void => { InteractionProgress13(); },
    (): void => { InteractionSurface14(); },
    (): void => { LifecycleStateSurface01(); },
    (): void => { LifecycleStatePolicy02(); },
    (): void => { LifecycleStateNotifications06(); },
    (): void => { LifecycleStateNotifications07(); },
    (): void => { LifecycleStateNotifications08(); },
    (): void => { LifecycleStateNotifications09(); },
    (): void => { PerformanceStabilitySurface01(); },
    (): void => { PerformanceStabilityNotifications02(); },
    (): void => { PerformanceStabilityNotifications04(); },
    (): void => { PerformanceStabilitySource05(); },
    (): void => { PerformanceStabilityProgress07(); },
    (): void => { PowerDialogNotifications01(); },
    (): void => { PowerDialogSurface08(); },
    (): void => { PowerDialogSeek09(); },
    (): void => { PowerDialogSource10(); },
    (): void => { PowerDialogSource11(); },
    (): void => { PowerDialogSource12(); },
    (): void => { PowerDialogSource13(); },
    (): void => { PowerValidationSource01(); },
    (): void => { PowerValidationSource03(); },
    (): void => { PowerValidationNotifications04(); },
    (): void => { PowerValidationNotifications06(); },
    (): void => { PowerValidationSeek07(); },
    (): void => { PowerValidationNotifications08(); },
    (): void => { SecuritySource01(); },
    (): void => { SecuritySurface02(); },
    (): void => { ValidationSurface01(); },
    (): void => { ValidationSeek02(); },
    (): void => { ValidationNotifications03(); },
    (): void => { ValidationSource04(); },
    (): void => { ValidationSeek07(); },
    (): void => { ValidationClock09(); },
    (): void => { ValidationProgress10(); },
    (): void => { ValidationSource11(); },
    (): void => { MatrixTime001(); },
    (): void => { MatrixTime002(); },
    (): void => { MatrixSurface001(); },
    (): void => { MatrixSurface002(); },
    (): void => { MatrixSurface003(); },
    (): void => { MatrixSeek001(); },
    (): void => { MatrixSeek002(); },
    (): void => { MatrixSeek003(); },
    (): void => { MatrixProgress001(); },
    (): void => { MatrixProgress002(); },
    (): void => { MatrixProgress003(); },
    (): void => { MatrixCatalog001(); },
    (): void => { MatrixCatalog002(); },
    (): void => { MatrixNotifications001(); },
    (): void => { MatrixNotifications002(); },
    (): void => { MatrixParser001(); },
    (): void => { MatrixParser002(); },
    (): void => { driverContractTest(); },
    (): void => {
      registerUiTests((): void => {
        abilityTest();
        videoUiTest();
        playerRuntimeTest();
      });
    }
  ]);
}
