function radial = radial_func(x, p)

fun = @(t) t.^2 .* p([t*x(1), t*x(2)]);
radial = integral(fun, 0, Inf);
radial = radial.^(1/3);

end

