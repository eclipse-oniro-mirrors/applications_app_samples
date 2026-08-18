'use static'
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

// [Start read_local_js_resource_from_rawfile_dir_via_file_api]
import { Builder, UIContext, Web, WebviewController, wrapBuilder, WrappedBuilder } from '@kit.ArkUI';
import { CustomBuilderT } from '@kit.ArkUI';
import { webview } from '@kit.ArkWeb';
import { Config, configs } from './PrecompileConfig';
import { BuilderData } from './DynamicComponent';

@Builder
function webBuilder(data: BuilderData) {
  Web({ src: data.url, controller: data.controller })
    .onControllerAttached(() => {
      precompile(data.controller, configs, data.context);
    })
    .fileAccess(true)
}

export const precompileWebview: WrappedBuilder<CustomBuilderT<BuilderData>> = wrapBuilder<CustomBuilderT<BuilderData>>(webBuilder);

export const precompile: (controller: WebviewController, configs: Array<Config>, context: UIContext) => Promise<void> = async (controller: WebviewController, configs: Array<Config>, context: UIContext): Promise<void> => {
  for (const config of configs) {
    let content = await readRawFile(config.localPath, context);

    try {
      controller.precompileJavaScript(config.url, content, config.options)
        .then(errCode => {
          console.info('precompile successfully! ' + errCode);
        }).catch((errCode: Error) => {
          console.error('precompile failed. ' + errCode.code);
      });
    } catch (err) {
      console.error('precompile failed. ' + err.code + ' ' + err.message);
    }
  }
}

async function readRawFile(path: string, context: UIContext): Promise<Uint8Array> {
  try {
    return await context.getHostContext()!.resourceManager.getRawFileContent(path);
  } catch (err) {
    return new Uint8Array(0);
  }
}
// [End read_local_js_resource_from_rawfile_dir_via_file_api]
