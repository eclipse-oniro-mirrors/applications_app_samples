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

// Import the sendable resource manager that performs the actual conversions.
import { sendableResourceManager } from '@kit.LocalizationKit';
// Import the summary model produced by the describe helper.
import { ResourceSummary } from '../model/ResourceTypes';
// Import the logger used for observable conversion logs.
import { Logger } from '../utils/Logger';

// The module tag used for every log line emitted by this service.
const TAG: string = 'Convert';

// Static service that converts resources between plain and sendable representations.
export class ResourceConvertService {
  // Converts a plain resource into its sendable representation for thread hops.
  static toSendable(resource: Resource): sendableResourceManager.SendableResource {
    // Delegate the conversion to the platform helper.
    return sendableResourceManager.resourceToSendableResource(resource);
  }

  // Converts a sendable resource back into its plain representation.
  static fromSendable(sendable: sendableResourceManager.SendableResource): Resource {
    // Delegate the reverse conversion to the platform helper.
    return sendableResourceManager.sendableResourceToResource(sendable);
  }

  // Builds a descriptive summary from a plain resource without converting it.
  static describe(resource: Resource): ResourceSummary {
    // Count the format parameters, treating the missing list as zero.
    const paramsCount: number = resource.params === undefined ? 0 : resource.params.length;
    // Log the described resource id for traceability.
    Logger.debug(TAG, `describe resource id=${resource.id}`);
    // Return the assembled summary in the success state.
    return {
      bundleName: resource.bundleName,
      moduleName: resource.moduleName,
      resourceId: resource.id,
      type: resource.type === undefined ? 0 : resource.type,
      paramsCount: paramsCount,
      costMs: 0,
      success: true,
      errorMessage: ''
    };
  }
}
