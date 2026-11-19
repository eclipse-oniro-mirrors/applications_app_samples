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

import { AppConfigValidator } from './AppConfigValidator';
import { CrossModuleValidator } from './CrossModuleValidator';
import type { BundleSnapshot } from './ConfigModels';
import type { Finding } from './FindingTypes';
import { ModuleConfigValidator } from './ModuleConfigValidator';

/**
 * Runs app, module and cross module validation in one pass.
 */
export class ValidationPipeline {
  /**
   * Validates every part of a bundle snapshot.
   */
  public static validate(snapshot: BundleSnapshot): Finding[] {
    const findings: Finding[] = [];
    ValidationPipeline.append(findings, AppConfigValidator.validate(snapshot.app));
    for (let index: number = 0; index < snapshot.modules.length; index++) {
      ValidationPipeline.append(findings, ModuleConfigValidator.validate(snapshot.modules[index]));
    }
    ValidationPipeline.append(findings, CrossModuleValidator.validate(snapshot));
    return findings;
  }

  /**
   * Validates only the module level rules of every module.
   */
  public static validateModules(snapshot: BundleSnapshot): Finding[] {
    const findings: Finding[] = [];
    for (let index: number = 0; index < snapshot.modules.length; index++) {
      ValidationPipeline.append(findings, ModuleConfigValidator.validate(snapshot.modules[index]));
    }
    return findings;
  }

  /**
   * Validates only the application level rules.
   */
  public static validateApp(snapshot: BundleSnapshot): Finding[] {
    return AppConfigValidator.validate(snapshot.app);
  }

  /**
   * Validates only the rules that span more than one module.
   */
  public static validateCross(snapshot: BundleSnapshot): Finding[] {
    return CrossModuleValidator.validate(snapshot);
  }

  /**
   * Appends source findings into the destination list.
   */
  private static append(destination: Finding[], source: Finding[]): void {
    for (let index: number = 0; index < source.length; index++) {
      destination.push(source[index]);
    }
  }
}
