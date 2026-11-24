/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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

import { CipherModel } from '../../../main/ets/model/CipherModel';

export interface CipherText {
  text: string;
}

export function aesEncryptAsync(model: CipherModel, message: string): Promise<CipherText> {
  return new Promise<CipherText>((resolve: (value: CipherText) => void) => {
    model.aesEncrypt(message, (result: CipherText) => {
      resolve(result);
    });
  });
}

export function aesDecryptAsync(model: CipherModel, message: string): Promise<CipherText> {
  return new Promise<CipherText>((resolve: (value: CipherText) => void) => {
    model.aesDecrypt(message, (result: CipherText) => {
      resolve(result);
    });
  });
}

export function rsaEncryptAsync(model: CipherModel, message: string): Promise<CipherText> {
  return new Promise<CipherText>((resolve: (value: CipherText) => void) => {
    model.rsaEncrypt(message, (result: CipherText) => {
      resolve(result);
    });
  });
}

export function rsaDecryptAsync(model: CipherModel, message: string): Promise<CipherText> {
  return new Promise<CipherText>((resolve: (value: CipherText) => void) => {
    model.rsaDecrypt(message, (result: CipherText) => {
      resolve(result);
    });
  });
}
