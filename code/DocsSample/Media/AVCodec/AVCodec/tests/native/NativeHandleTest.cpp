/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include <cstdlib>
#include <iostream>
#include "NativeHandle.h"
namespace {
void Require(bool condition, const char *message)
{
    if (!condition) {
        std::cerr << message << std::endl;
        std::exit(EXIT_FAILURE);
    }
}

constexpr int CLOSE_FAILURE = -17;
struct Resource {
    int closes = 0;
    int result = 0;
};
int Close(Resource *resource)
{
    ++resource->closes;
    return resource->result;
}
using Owner = NativeHandle<Resource, Close>;
void TestMoveAndReplace()
{
    Resource first;
    Owner source(&first);
    Owner target(std::move(source));
    Require(source.Get() == nullptr, "source.Get() == nullptr");
    Require(target.Get() == &first, "target.Get() == &first");
    Resource second;
    *target.Put() = &second;
    Require(first.closes == 1, "first.closes == 1");
    source = std::move(target);
    Require(target.Get() == nullptr, "target.Get() == nullptr");
    Require(source.Close() == 0, "source.Close() == 0");
    Require(source.Close() == 0, "source.Close() == 0");
    Require(second.closes == 1, "second.closes == 1");
}
void TestFailedCloseAndDestructor()
{
    Resource resource;
    resource.result = CLOSE_FAILURE;
    {
        Owner owner(&resource);
        Require(owner.Close() == CLOSE_FAILURE, "owner.Close() == CLOSE_FAILURE");
        Require(owner.Get() == nullptr, "owner.Get() == nullptr");
    }
    Require(resource.closes == 1, "resource.closes == 1");
    Resource partial;
    {
        Owner owner(&partial);
    }
    Require(partial.closes == 1, "partial.closes == 1");
}
}
int main()
{
    TestMoveAndReplace();
    TestFailedCloseAndDestructor();
}
