/**
 * @name Comp3310 Assignment 1 Exercise 11 query
 * @problem.severity Warning
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
select call


