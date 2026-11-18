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
#include <cassert>
#include "NativeHandle.h"
namespace {
struct Resource { int closes = 0; int result = 0; };
int Close(Resource *resource) { ++resource->closes; return resource->result; }
using Owner = NativeHandle<Resource, Close>;
void TestMoveAndReplace()
{
    Resource first;
    Resource second;
    Owner source;
    source = &first;
    Owner target(std::move(source));
    assert(source.Get() == nullptr);
    assert(target.Get() == &first);
    *target.Put() = &second;
    assert(first.closes == 1);
    source = std::move(target);
    assert(target.Get() == nullptr);
    assert(source.Close() == 0);
    assert(source.Close() == 0);
    assert(second.closes == 1);
}
void TestFailedCloseAndDestructor()
{
    Resource resource;
    resource.result = -17;
    {
        Owner owner;
        owner = &resource;
        assert(owner.Close() == -17);
        assert(owner.Get() == nullptr);
    }
    assert(resource.closes == 1);
    Resource partial;
    { Owner owner; owner = &partial; }
    assert(partial.closes == 1);
}
}
int main()
{
    TestMoveAndReplace();
    TestFailedCloseAndDestructor();
}
