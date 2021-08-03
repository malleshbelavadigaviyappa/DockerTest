#!/bin/bash -e

# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

if [[ $OSTYPE == "cygwin" ]] ; then
    PATHSEP=";"
else
    PATHSEP=":"
fi

TOPLA_HOME=/usr/local
export TOPLA_HOME

#Make sure environment variables are properly set
if [ -e "$JAVA_HOME"/bin/java ] ; then
    if [ -n "$TOPLA_HOME" ] ; then
                # Build the classpath
        CLASSPATH=""
        for filename in $(ls -1 "$TOPLA_HOME"/processes/documentum/lib-proprietary) ; do
            if [ -n "$CLASSPATH" ] ; then
                CLASSPATH="$CLASSPATH""$PATHSEP""$TOPLA_HOME"/processes/documentum/lib-proprietary/"$filename"
            else
                CLASSPATH="$TOPLA_HOME"/processes/documentum/lib-proprietary/"$filename"
            fi

        done
        CLASSPATH="$CLASSPATH""$PATHSEP""$TOPLA_HOME"/processes/documentum/lib/topla-processes-1.0-SNAPSHOT.jar"$PATHSEP""$TOPLA_HOME"/processes/documentum/lib/mcf-connector-documentum-common-1.0-SNAPSHOT.jar
        export CLASSPATH
        echo $CLASSPATH
        "$JAVA_HOME/bin/java" -Xmx32m -Xms32m -cp "$CLASSPATH" com.infodna.topla.migrate.documentum.registry.DCTM
        exit $?
    else
        echo $TOPLA_HOME
        echo "Environment variable TOPLA_HOME is not properly set." 1>&2
        exit 1
    fi
    
else
    echo "Environment variable JAVA_HOME is not properly set." 1>&2
    exit 1
fi
