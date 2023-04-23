/**
 * @id comp3310-query
 * @name query for COMP3310 assignment
 * @description This is a query for the COMP3310 assignment.
 * @kind problem
 * @problem.severity error
 * @precision high
 * @tags security
 */

import java

from MethodAccess call
where
    (
        call.getMethod().hasName("printStackTrace") and
        call.getMethod().getDeclaringType().hasQualifiedName("java.lang", "Throwable") and
        call.getMethod().getNumberOfParameters() = 0
    ) or (
        exists(MethodAccess getMessage |
            getMessage.getMethod().hasName("getMessage") and
            getMessage.getMethod().getDeclaringType().hasQualifiedName("java.lang", "Throwable") and
            call.getMethod().hasName("println") and
            call.getMethod().getDeclaringType().hasQualifiedName("java.io", "PrintStream") and
            call.getArgument(0) = getMessage
        )
    )
    select call, "Detected a call to 'printStackTrace()' or printing 'getMessage' which is not a recommended practice."



