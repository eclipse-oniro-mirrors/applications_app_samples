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

// Import the common context type used by the font file operations.
import { common } from '@kit.AbilityKit';
// Import the UI context type used for font preview registration.
import { UIContext } from '@kit.ArkUI';
// Import the taskpool used by the taskpool conversion path.
import { taskpool } from '@kit.ArkTS';
// Import the sendable resource manager types for the resource bridge.
import { sendableResourceManager } from '@kit.LocalizationKit';
// Import the font domain models used by the facade signatures.
import { CapabilityCheck, ErrorExplain, FontAsset } from './model/FontTypes';
// Import the resource domain models used by the resource bridge.
import { ResourceCarrier, ResourceSummary } from './model/ResourceTypes';
// Import the capability probing service.
import { CapabilityService } from './feature/CapabilityService';
// Import the sandbox file service.
import { FontFileService } from './feature/FontFileService';
// Import the system font manager service.
import { FontManagerService } from './feature/FontManagerService';
// Import the preview registration service.
import { FontPreviewService } from './feature/FontPreviewService';
// Import the resource conversion service.
import { ResourceConvertService } from './feature/ResourceConvertService';
// Import the worker based conversion client.
import { ResourceWorkerClient } from './feature/ResourceWorkerClient';
// Import the concurrent taskpool conversion function.
import { roundTripResource } from './feature/ResourceTask';
// Import the logger used for facade checkpoint logs.
import { Logger } from './utils/Logger';
// Import the trace facade used for facade level trace marks.
import { TraceUtil } from './utils/TraceUtil';

// The magic path value that selects the worker based conversion route.
const WORKER_PATH: string = 'worker';
// The module tag used for facade log lines.
const TAG: string = 'FontResource';
// The module tag used for resource bridge log lines.
const TAG_BRIDGE: string = 'ResourceBridge';

// The public facade for every font capability exposed by the library.
export class FontResource {
  // Runs all capability self-checks and returns the assembled rows.
  static checkCapability(): Promise<CapabilityCheck[]> {
    // Log the facade call for traceability.
    Logger.debug(TAG, 'checkCapability called');
    // Delegate the probe to the capability service.
    return CapabilityService.checkFontCapability();
  }

  // Resolves the current sandbox state of the asset without copying anything.
  static resolveAsset(context: common.Context, asset: FontAsset): FontAsset {
    // Log the facade call with the family name.
    Logger.debug(TAG, `resolveAsset for ${asset.familyName}`);
    // Delegate the lookup to the file service.
    return FontFileService.resolveExisting(context, asset);
  }

  // Ensures the font file exists in the sandbox, copying it from resources when needed.
  static prepareAsset(context: common.Context, asset: FontAsset): Promise<FontAsset> {
    // Log the facade call with the family name.
    Logger.info(TAG, `prepareAsset for ${asset.familyName}`);
    // Delegate the copy flow to the file service.
    return FontFileService.ensureFontInSandbox(context, asset);
  }

  // Returns the sandbox font file size in bytes, or -1 when it is missing.
  static fileSize(filePath: string): number {
    // Delegate the size probe to the file service.
    return FontFileService.fileSize(filePath);
  }

  // Installs the font file at the given sandbox path through the system font manager.
  static install(filePath: string): Promise<number> {
    // Log the facade call with the target path.
    Logger.info(TAG, `install ${filePath}`);
    // Delegate the install to the font manager service.
    return FontManagerService.install(filePath);
  }

  // Uninstalls the font registered under the given full name.
  static uninstall(fullName: string): Promise<number> {
    // Log the facade call with the target name.
    Logger.info(TAG, `uninstall ${fullName}`);
    // Delegate the uninstall to the font manager service.
    return FontManagerService.uninstall(fullName);
  }

  // Explains a numeric font error code using the shared registry.
  static explain(code: number): ErrorExplain {
    // Delegate the lookup to the font manager service.
    return FontManagerService.explain(code);
  }

  // Registers the sandbox font with the UI for on-screen previews.
  static registerPreview(uiContext: UIContext, familyName: string, sandboxPath: string): void {
    // Log the facade call with the family name.
    Logger.info(TAG, `registerPreview for ${familyName}`);
    // Delegate the registration to the preview service.
    FontPreviewService.register(uiContext, familyName, sandboxPath);
  }
}

// The public facade for every resource conversion capability exposed by the library.
export class ResourceBridge {
  // Converts a plain resource into its sendable representation.
  static toSendable(resource: Resource): sendableResourceManager.SendableResource {
    // Delegate the conversion to the convert service.
    return ResourceConvertService.toSendable(resource);
  }

  // Converts a sendable resource back into its plain representation.
  static fromSendable(sendable: sendableResourceManager.SendableResource): Resource {
    // Delegate the reverse conversion to the convert service.
    return ResourceConvertService.fromSendable(sendable);
  }

  // Builds a descriptive summary from a plain resource.
  static describe(resource: Resource): ResourceSummary {
    // Delegate the summary build to the convert service.
    return ResourceConvertService.describe(resource);
  }

  // Runs one full conversion round trip on the requested concurrency path.
  static runRoundTrip(path: string, carrier: ResourceCarrier): Promise<ResourceSummary> {
    // Open a trace section around the route dispatch.
    const taskId: number = TraceUtil.begin('ResourceBridge.runRoundTrip');
    // Log the chosen route for traceability.
    TraceUtil.point(TAG_BRIDGE, `runRoundTrip path=${path}`);
    // Select the worker based route when the magic path value is used.
    if (path === WORKER_PATH) {
      // Close the dispatch trace before entering the worker client which traces itself.
      TraceUtil.end('ResourceBridge.runRoundTrip', taskId);
      // Run the conversion inside the dedicated worker thread.
      return ResourceWorkerClient.run(carrier);
    }
    // Run the conversion inside the shared taskpool and close the trace on settle.
    return taskpool.execute<[ResourceCarrier], ResourceSummary>(roundTripResource, carrier).then(
      (summary: ResourceSummary) => {
        // Close the trace section on the taskpool success path.
        TraceUtil.end('ResourceBridge.runRoundTrip', taskId);
        // Forward the conversion summary untouched.
        return summary;
      }).catch((error: Error) => {
      // Log the taskpool failure path.
      Logger.error(TAG_BRIDGE, `taskpool round trip failed: ${error.message}`);
      // Close the trace section on the taskpool failure path.
      TraceUtil.end('ResourceBridge.runRoundTrip', taskId);
      // Re-throw so the caller error handling stays intact.
      throw error;
    });
  }
}
