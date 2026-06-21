using Godot;
using System;
using System.Diagnostics;
using System.Runtime.InteropServices;

namespace #{name}.Lib;

public enum LibError { }

public abstract partial record Option<T>
{
    private Option() { }

    public sealed record Some(T Value) : Option<T>;
    public sealed record None() : Option<T>;


    public TOut Match<TOut>(
        Func<T, TOut> some,
        Func<TOut> none) =>
        this switch
        {
            Some s => some(s.Value),
            None => none(),
            _ => throw new UnreachableException()
        };

    public void Match(
        Action<T> some,
        Action none)
    {
        switch (this)
        {
            case Some s:
                some(s.Value);
                break;
            case None:
                none();
                break;
            default:
                throw new UnreachableException();
        }
    }

    public T UnwrapOr(T fallback) =>
        Match(
            some: v => v,
            none: () => fallback
        );

    public T? UnwrapOrDefault() =>
        Match(
            some: v => v,
            none: () => default!
        );

    public bool IsSome => this is Some;

    public bool IsNone => this is None;
}

public abstract partial record Result<T, E>
{
    private Result() { }

    public sealed record Ok(T Value) : Result<T, E>;
    public sealed record Err(E Error) : Result<T, E>;

    public TOut Match<TOut>(
        Func<T, TOut> ok,
        Func<E, TOut> err) =>
        this switch
        {
            Ok o => ok(o.Value),
            Err e => err(e.Error),
            _ => throw new UnreachableException()
        };

    public void Match(
        Action<T> ok,
        Action<E> err)
    {
        switch (this)
        {
            case Ok s:
                ok(s.Value);
                break;
            case Err s:
                err(s.Error);
                break;
            default:
                throw new UnreachableException();
        }
    }

    public T UnwrapOr(T fallback) =>
    Match(
        ok: v => v,
        err: _ => fallback
    );

    public T? UnwrapOrDefault() =>
        Match(
            ok: v => v,
            err: _ => default!
        );

    public Option<T> ToOption() =>
        this switch
        {
            Ok o => new Option<T>.Some(o.Value),
            Err => new Option<T>.None(),
            _ => throw new UnreachableException()
        };

    public bool IsOk => this is Ok;

    public bool IsErr => this is Err;
}
