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

import { ErrorEvent, MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';
import { colorSpaceManager, sendableColorSpaceManager } from '@kit.ArkGraphics2D';
import { collections } from '@kit.ArkTS';
import { ColorSpaceResult } from '../sendable/ColorSpaceResult';
import { getColorSpaceNameStr } from '../common/ColorSpaceData';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

workerPort.onmessage = (e: MessageEvents) => {
    let cs: sendableColorSpaceManager.ColorSpaceManager =
        e.data as sendableColorSpaceManager.ColorSpaceManager;
    let csName: colorSpaceManager.ColorSpace = cs.getColorSpaceName();
    let whitePoint: collections.Array<number> = cs.getWhitePoint();
    let gamma: number = cs.getGamma();
    let wpX: number = 0;
    let wpY: number = 0;
    if (whitePoint.length >= 2) {
        wpX = whitePoint[0];
        wpY = whitePoint[1];
    }
    let nameStr: string = getColorSpaceNameStr(csName);
    let result: ColorSpaceResult = new ColorSpaceResult(nameStr, wpX, wpY, gamma);
    workerPort.postMessageWithSharedSendable(result);
};

workerPort.onmessageerror = (e: MessageEvents) => {
    let errMsg: string = `Worker message error: ${JSON.stringify(e.data)}`;
    let errResult: ColorSpaceResult = new ColorSpaceResult(errMsg, 0, 0, 0);
    workerPort.postMessageWithSharedSendable(errResult);
};

workerPort.onerror = (e: ErrorEvent) => {
    let errMsg: string = `Worker error: ${e.message}`;
    let errResult: ColorSpaceResult = new ColorSpaceResult(errMsg, 0, 0, 0);
    workerPort.postMessageWithSharedSendable(errResult);
};
