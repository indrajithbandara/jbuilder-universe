# This file is part of the Watson Conversation Service OCaml API project.
#
# Copyright 2016-2017 IBM Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


JBUILDER ?= jbuilder

all: build

build:
	$(JBUILDER) build @install

test:
	$(JBUILDER) runtest

install:
	$(JBUILDER) install

uninstall:
	$(JBUILDER) uninstall

clean:
	rm -rf _build *.install

cleanall: clean
	rm -f *~ \
		wcs-cli/.merlin wcs-lib/.merlin examples/.merlin

realcleanall: cleanall
	rm -f bin/wcs


.PHONY: all build test clean cleanall
