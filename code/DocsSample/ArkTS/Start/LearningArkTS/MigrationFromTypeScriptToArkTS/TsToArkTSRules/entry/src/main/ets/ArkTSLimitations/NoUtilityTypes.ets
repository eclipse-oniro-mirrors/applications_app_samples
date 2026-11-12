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
// [Start no_utility_types]
interface Todo {
  title: string;
  description: string;
  completed: boolean;
}

// 直接定义所需接口，替代Pick
interface TodoPreview {
  title: string;
  completed: boolean;
}

const todo: TodoPreview = {
  title: 'Clean room',
  completed: false,
};

// 直接定义所需接口，替代Omit
interface TodoInfo {
  title: string;
}

const todoInfo: TodoInfo = {
  title: 'Pick up kids',
};
// [End no_utility_types]
